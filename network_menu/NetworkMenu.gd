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
	
	if http.has_response():
		# If there is a response..
		
		headers = http.get_response_headers_as_dictionary() # Get response headers
		print("code: ", http.get_response_code()) # Show response code
		print("**headers:\\n", headers) # Show headers
		
		# Getting the HTTP Body
		
		if http.is_response_chunked():
			# Does it use chunks?
			print("Response is Chunked!")
		else:
			# Or just plain Content-Length
			var bl = http.get_response_body_length()
			print("Response Length: ",bl)

		# This method works for both anyway

		var rb = PoolByteArray() # Array that will hold the data

		while http.get_status() == HTTPClient.STATUS_BODY:
			# While there is body left to be read
			http.poll()
			var chunk = http.read_response_body_chunk() # Get a chunk
			if chunk.size() == 0:
				# Got nothing, wait for buffers to fill a bit
				OS.delay_usec(1000)
			else:
				rb = rb + chunk # Append to read buffer

		# Done!

		print("bytes got: ", rb.size())
		var text = rb.get_string_from_ascii()
		print("Text: ", text)
		var results = JSON.parse(text)
		if results.error == OK and typeof(results.result) == TYPE_DICTIONARY:
			var server_list = results.result["servers"]
			$HBoxContainer/MarginContainer2/VBoxContainer2/GamesListContainer.update_list(server_list)
	
#	$HTTPRequest.request("https://nolic.simmarith.com")
#
#func _on_HTTPRequest_request_completed(result, response_code, headers, body):
#	print(body.get_string_from_utf8())
#	var json = JSON.parse(body.get_string_from_utf8())
#	print(json.result)
