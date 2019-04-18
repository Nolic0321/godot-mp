extends Panel


func _ready():
	refresh_list()
	pass

func _on_Single_Player_Pressed():
	print_debug("NEED TO IMPLEMENT SINGLEPLAYER")


func _on_Host_pressed():
	gamestate.start_host()

# Respond to user entering a username
# Save the string to the (global) gamestate that will be used when connecting
# to the actual game.
func _on_Username_text_changed():
	gamestate.player_name = $HBoxContainer/MarginContainer/VBoxContainer/Username.text

# Refreshes list of joinable games
# Pings master server for list and updtes the UI container
func refresh_list():
		$RequestGameList.request("https://api.simmarith.com/nolic/server")

# HTTPRequest for server list response
# Updates game list on UI if result is ok
func _on_HTTPRequest_request_completed(results, response_code, headers, body):
	print(body.get_string_from_utf8())
	var json = JSON.parse(body.get_string_from_utf8())
	if typeof(json.result) == TYPE_DICTIONARY:
		var server_list = json.result["servers"]
		$HBoxContainer/MarginContainer2/VBoxContainer2/GamesListContainer.update_list(server_list, get_path())


func _on_RefreshList_pressed():
	refresh_list()


func _on_GameName_text_changed():
	gamestate.server_name = $HBoxContainer/MarginContainer/VBoxContainer/GameName.text
	pass # Replace with function body.
