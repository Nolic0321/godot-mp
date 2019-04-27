extends Panel

onready var is_checking_game_name: bool = false

func _ready():
	
	gamestate.game_menu_path = get_path() 	# Update the gamestate to have our nodepath
	$RequestGameList.use_threads = true		# Have HTTPRequests use separate threads
	refresh_list()			# Refresh the game list on load
	
	# Set Default Values
	$HBoxContainer/MarginContainer/VBoxContainer/Username.text = gamestate.player_name
	$HBoxContainer/MarginContainer/VBoxContainer/Port.text = String(gamestate.DEFAULT_PORT)
	$HBoxContainer/MarginContainer/VBoxContainer/GameName.text = gamestate.server_name
	pass

func _on_Single_Player_Pressed():
	print_debug("NEED TO IMPLEMENT SINGLEPLAYER")

# Fired by pressing the "Host Game" button.  Will
# request the list of current servers and then set
# the "is_checking_game_name" bool to enable game name
# checking in _on_HTTPRequest_request_completed()
func _on_Host_pressed():
	#Check game name availability
	$RequestGameList.request("https://api.simmarith.com/nolic/server")
	is_checking_game_name = true
	
# Actually start the host.  This should be called
# after we've checked whether or not the game name
# hasn't been used already via _on_Host_pressed()
func _host_game():
	gamestate.start_host()

# Respond to user entering a username
# Save the string to the (global) gamestate that will be used when connecting
# to the actual game.
func _on_Username_text_changed():
	gamestate.player_name = $HBoxContainer/MarginContainer/VBoxContainer/Username.text

# Refreshes list of joinable games
# Pings master server for list and updtes the UI container
func refresh_list():
		is_checking_game_name = false
		$RequestGameList.request("https://api.simmarith.com/nolic/server")

# HTTPRequest for server list response
# Updates game list on UI if result is ok
func _on_HTTPRequest_request_completed(results, response_code, headers, body):
	print(body.get_string_from_utf8())
	var json = JSON.parse(body.get_string_from_utf8())
	
	if is_checking_game_name:
		is_checking_game_name = false
		for server in json.result["servers"]:
			if server.name == gamestate.server_name:
				$HBoxContainer/MarginContainer/VBoxContainer/Warning.text = "Name '" + gamestate.server_name + "' is already in use"
				$HBoxContainer/MarginContainer/VBoxContainer/Warning.show()
				return
		_host_game()
	else:
		if typeof(json.result) == TYPE_DICTIONARY:
			var server_list = json.result["servers"]
			$HBoxContainer/MarginContainer2/VBoxContainer2/GamesListContainer.update_list(server_list, get_path())


func _on_RefreshList_pressed():
	refresh_list()


func _on_GameName_text_changed():
	gamestate.server_name = $HBoxContainer/MarginContainer/VBoxContainer/GameName.text
	


func _on_Port_text_changed():
	gamestate.port = int(($HBoxContainer/MarginContainer/VBoxContainer/Port as TextEdit).text)
	
