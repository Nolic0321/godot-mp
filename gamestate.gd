extends Node

# Default game port
const DEFAULT_PORT = 8996

# Default game ip
const DEFAULT_IP = "127.0.0.1"

# Max number of players
var MAX_PEERS = 12

# External IP for connecting
var external

# User Selected Port
var port

# Name of game server for joining list
var server_name = "Server"

# Name for my player
var player_name = "Host"

# Names for remote players in id:name format
var players = {}

# NodePath to the game menu
var game_menu_path

# UPNP for network connections
onready var upnp = UPNP.new()

# Signals to let lobby GUI know what's going on
signal player_list_changed()
signal connection_failed()
signal connection_succeeded()
signal game_ended()
signal game_error(what)
signal unregister_player(id)
signal add_client_player(client)
signal spawn_host_player(host)


	
func start_single_player():
	start_game()
	
func is_game_name_available(game_name) -> bool:
	
	return true

func start_host():
	if port == null:
		port = DEFAULT_PORT
	if upnp.get_device_count() > 0:
		upnp.add_port_mapping(port)
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(port, MAX_PEERS)
	get_tree().set_network_peer(peer)
	save_peer_data(peer)
	_send_host_data()
	
	#Send info to master server every 25 seconds
	var timer = Timer.new()
	timer.name = "SendHostDataTimer"
	timer.wait_time = 25
	timer.autostart = true
	add_child(timer)
	timer.connect("timeout",self,"_send_host_data")
	#Start the game
	start_game()
	
func _send_host_data():
	master_server.send_server(server_name,external,port)
	
func join_server(name : String):
	var http = HTTPRequest.new()
	http.name = "GetHostDataRequest"
	add_child(http)
	http.request("https://api.simmarith.com/nolic/server/" + name)
	http.connect("request_completed",self,"load_game")

func load_game(result, responsecode, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	var hostip = json.result["ip"]
	var hostport = json.result["port"]
	
	if hostip == external:
		hostip = DEFAULT_IP
	
	var peer = NetworkedMultiplayerENet.new()
	var conn_result = peer.create_client(hostip, hostport)
	get_tree().set_network_peer(peer)
	save_peer_data(peer)
	
func save_peer_data(peer):
	get_tree().set_meta("network_peer", peer)

func start_game():
	get_node(game_menu_path).hide()
	var selfPeerID = get_tree().get_network_unique_id()
	#Load world node
	var world = preload("res://GameScene.tscn").instance()
	get_tree().get_root().add_child(world)
	connect("add_client_player",world,"spawn_entity")
	
	#Spawn Player
	var player : Player = preload("res://characters/actor/Player/Player.tscn").instance()
	player.name = String(selfPeerID)
	player.set_name(player_name)
	player.set_network_master(selfPeerID)
	emit_signal("add_client_player",player)


# Register new player to game
remote func register_player(id : int, new_player_name : String):
	
	# ************Server-side code************
	
	if get_tree().is_network_server():
		# If we are the server, let everyone know about the new player
		rpc_id(id, "register_player", 1, player_name) # Send myself to new dude
		for p_id in players: # Then, for each remote player
			rpc_id(id, "register_player", p_id, players[p_id]) # Send player to new dude
			rpc_id(p_id, "register_player", id, new_player_name) # Send new dude to player
	#*****************************************
	
	#Adding registered player on client side
	global_debug.debug_client("Creating player " + new_player_name)
	players[id] = new_player_name
	var otherplayer = preload("res://characters/actor/Player/Player.tscn").instance()
	otherplayer.name = String(id)
	otherplayer.set_name(new_player_name)
	otherplayer.set_network_master(id)
	emit_signal("add_client_player",otherplayer)
	

remote func unregister_player(id):
	emit_signal("unregister_player",id)
	players.erase(id)

# Callback from SceneTree
func _player_disconnected(id):
	if get_tree().is_network_server():
		# If we are the server, tell all players to unregister disc player
		unregister_player(id)
		for p_id in players:
			# Erase in the server
			rpc_id(p_id, "unregister_player", id)

# Callback from SceneTree, only for clients (not server)
func _connected_ok():
	# Registration of a client beings here, tell everyone that we are here
	rpc("register_player", get_tree().get_network_unique_id(), player_name)
	
	#Start the game
	global_debug.debug_client("Starting game")
	print_debug("Starting game")
	start_game()
	emit_signal("connection_succeeded")

# Callback from SceneTree, only for clients (not server)
func _server_disconnected():
	emit_signal("game_error", "Server disconnected")
	get_tree().quit()

# Callback from SceneTree, only for clients (not server)
func _connected_fail():
	print_debug("Connection failed")
	get_tree().set_network_peer(null) # Remove peer
	emit_signal("connection_failed")

func _ready():
	# Setup UPNP for network discovery
#	upnp.discover_ipv6 = true
	var upnp_result = upnp.discover()
	if upnp_result != UPNP.UPNP_RESULT_SUCCESS:
		print_debug("UPNP discover failed with code " + upnp_result)
	
	external = upnp.query_external_address()
#	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("network_peer_disconnected", self,"_player_disconnected")
	get_tree().connect("connected_to_server", self, "_connected_ok")
	get_tree().connect("connection_failed", self, "_connected_fail")
	get_tree().connect("server_disconnected", self, "_server_disconnected")

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		if is_instance_valid(port) and upnp.get_device_count() > 0:
			upnp.delete_port_mapping(port)
		get_tree().quit() # default behavior