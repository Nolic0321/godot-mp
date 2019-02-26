extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	get_server_list()
	pass

func _on_Join_pressed():
	gamestate.join_server()
	$Panel.hide()


func _on_Host_pressed():
	gamestate.start_host()
	$Panel.hide()


func _on_Username_text_changed():
	gamestate.player_name = $Panel/Username.text

func get_server_list():
	$HTTPRequest.request("https://nolic.simmarith.com")

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	print(body.get_string_from_utf8())
	var json = JSON.parse(body.get_string_from_utf8())
	print(json.result)
