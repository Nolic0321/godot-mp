extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	refresh_list()
	pass

func _on_Join_pressed():
	gamestate.start_single_player()
	self.hide()


func _on_Host_pressed():
	gamestate.start_host()
	self.hide()


func _on_Username_text_changed():
	gamestate.player_name = $HBoxContainer/MarginContainer/VBoxContainer/Username.text

func refresh_list():
		var results = master_server.get_server_list()
		if is_instance_valid(results) and results.error == OK and typeof(results.result) == TYPE_DICTIONARY:
			var server_list = results.result["servers"]
			$HBoxContainer/MarginContainer2/VBoxContainer2/GamesListContainer.update_list(server_list)
	
#	$HTTPRequest.request("https://nolic.simmarith.com")
#
#func _on_HTTPRequest_request_completed(result, response_code, headers, body):
#	print(body.get_string_from_utf8())
#	var json = JSON.parse(body.get_string_from_utf8())
#	print(json.result)
