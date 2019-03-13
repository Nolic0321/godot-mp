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
<<<<<<< Updated upstream
	$HTTPRequest.request("http://api.simmarith.com/nolic/server")

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
=======
	var http = HTTPClient.new()
	var err = http.connect_to_host("https://api.simmarith.com",443 ,true, true)
	assert(err == OK)
    # Wait until resolved and connected
	while http.get_status() == HTTPClient.STATUS_CONNECTING or http.get_status() == HTTPClient.STATUS_RESOLVING:
		http.poll()
		print("Connecting.. - " + String(http.get_status()))
		OS.delay_msec(500)
	
	assert(http.get_status() == HTTPClient.STATUS_CONNECTED) # Could not connect
	var headers = [ "Content-Type:application/json; charset=utf-8" ]
	err = http.request(HTTPClient.METHOD_GET,"/nolic/server",headers)
	#assert(err == OK) # Make sure all is OK

	while http.get_status() == HTTPClient.STATUS_REQUESTING:
		# Keep polling until the request is going on
		http.poll()
		print("Requesting.. - " + String(http.get_status()))
		OS.delay_msec(500)
	
	#assert(http.get_status() == HTTPClient.STATUS_BODY or http.get_status() == HTTPClient.STATUS_CONNECTED)
	
	print("resposne? ", http.has_response())
	
#	$HTTPRequest.request("https://nolic.simmarith.com")
#
#func _on_HTTPRequest_request_completed(result, response_code, headers, body):
#	print(body.get_string_from_utf8())
#	var json = JSON.parse(body.get_string_from_utf8())
#	print(json.result)
>>>>>>> Stashed changes
