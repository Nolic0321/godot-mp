extends Node

# Default game port
const DEFAULT_PORT = 10567

# Max number of players
var MAX_PEERS = 12

var host_ip = "127.0.0.1"

# Name of game server for joining list
var server_name = "Test"

# Name for my player
var player_name = "The Client"

# Names for remote players in id:name format
var players = {}

# UPNP for network connections
onready var upnp = UPNP.new()

# Signals to let lobby GUI know what's going on
signal player_list_changed()
signal connection_failed()
signal connection_succeeded()
signal game_ended()
signal game_error(what)


	
func start_single_player():
	start_game()
	
func start_host():
	upnp.add_port_mapping(DEFAULT_PORT)
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(DEFAULT_PORT, MAX_PEERS)
	get_tree().set_network_peer(peer)
	save_peer_data(peer)
	_send_host_data()
	
	#Send info to master server every 25 seconds
	var timer = Timer.new()
	timer.wait_time = 25
	timer.autostart = true
	add_child(timer)
	timer.connect("timeout",self,"_send_host_data")
	#Start the game
	start_game()
	
func _send_host_data():
	print_debug("Sending host data")
	master_server.send_server(server_name,upnp.query_external_address(),DEFAULT_PORT)
	
func join_server(host_ip, port):
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(host_ip, port)
	get_tree().set_network_peer(peer)
	save_peer_data(peer)
	
func save_peer_data(peer):
	get_tree().set_meta("network_peer", peer)

func start_game():
	var selfPeerID = get_tree().get_network_unique_id()
	#Load world node
	var world = preload("res://GameScene.tscn").instance()
	get_tree().get_root().add_child(world)
	
	#Spawn Player
	var player = preload("res://entity/Entity.tscn").instance()
	player.name = String(selfPeerID)
	player.set_name(player_name)
	player.set_network_master(selfPeerID)
	world.spawn_entity(player)
		

# Register new player to server; should only be called on server
remote func register_player(id, new_player_name):
	#Server-side code
	if get_tree().is_network_server():
		# If we are the server, let everyone know about the new player
		rpc_id(id, "register_player", 1, player_name) # Send myself to new dude
		for p_id in players: # Then, for each remote player
			rpc_id(id, "register_player", p_id, players[p_id]) # Send player to new dude
			rpc_id(p_id, "register_player", id, new_player_name) # Send new dude to player

	#Adding registered player on client side
	players[id] = new_player_name
	var otherplayer = preload("res://entity/Entity.tscn").instance()
	otherplayer.name = String(id)
	otherplayer.set_name(new_player_name)
	otherplayer.set_network_master(id)
	get_node("/root/GameScene/Players").add_child(otherplayer)
	
remote func unregister_player(id):
	players.erase(id)
	
# Callback from SceneTree
func _player_connected(id):
	# This is not used in this demo, because _connected_ok is called for clients
	# on success and will do the job.
	pass

# Callback from SceneTree
func _player_disconnected(id):
	if get_tree().is_network_server():
		if has_node("/root/GameScene"): # Game is in progress
			emit_signal("game_error", "Player " + players[id] + " disconnected")
		else: # Game is not in progress
			# If we are the server, send to the new dude all the already registered players
			unregister_player(id)
			for p_id in players:
				# Erase in the server
				rpc_id(p_id, "unregister_player", id)

# Callback from SceneTree, only for clients (not server)
func _connected_ok():
	# Registration of a client beings here, tell everyone that we are here
	rpc("register_player", get_tree().get_network_unique_id(), player_name)
	
	#Start the game
	start_game()
	emit_signal("connection_succeeded")

# Callback from SceneTree, only for clients (not server)
func _server_disconnected():
	emit_signal("game_error", "Server disconnected")

# Callback from SceneTree, only for clients (not server)
func _connected_fail():
	get_tree().set_network_peer(null) # Remove peer
	emit_signal("connection_failed")

func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("network_peer_disconnected", self,"_player_disconnected")
	get_tree().connect("connected_to_server", self, "_connected_ok")
	get_tree().connect("connection_failed", self, "_connected_fail")
	get_tree().connect("server_disconnected", self, "_server_disconnected")
	# Setup UPNP for network discovery
#	upnp.discover_ipv6 = true
	var upnp_result = upnp.discover()
	if upnp_result != UPNP.UPNP_RESULT_SUCCESS:
		print_debug("UPNP discover failed with code " + upnp_result)
	elif upnp_result == UPNP.UPNP_RESULT_SUCCESS:
		host_ip = upnp.query_external_address()

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		upnp.delete_port_mapping(DEFAULT_PORT)
		get_tree().quit() # default behavior