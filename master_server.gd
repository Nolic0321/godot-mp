extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func send_server(game_name, ip, port):
	print_debug("Starting up a server")
	
	var http = HTTPClient.new()
	var err = http.connect_to_host("https://api.simmarith.com",443 ,true, true)
	assert(err == OK)
	# Wait until resolved and connected
	print_debug("Connecting to API")
	while http.get_status() == HTTPClient.STATUS_CONNECTING or http.get_status() == HTTPClient.STATUS_RESOLVING:
		http.poll()
#		print("Connecting.. - " + String(http.get_status()))
		OS.delay_msec(500)
	
	assert(http.get_status() == HTTPClient.STATUS_CONNECTED) # Could not connect
	var headers = [ "Content-Type:application/json; charset=utf-8" ]
	var server_object = "{\"name\":\"" + game_name + "\",\"ip\":\"" + ip + "\",\"port\":" + String(port) + "}"
	err = http.request(HTTPClient.METHOD_POST,"https://api.simmarith.com",headers,server_object)
	
	print_debug("Sending server data")
	while http.get_status() == HTTPClient.STATUS_REQUESTING:
		http.poll()
		OS.delay_msec(5000)
	
	print_debug("Server data sent with " + http.get_status())
	
func get_server_list():
	var http = HTTPClient.new()
	var err = http.connect_to_host("https://api.simmarith.com",443 ,true, true)
	assert(err == OK)
	# Wait until resolved and connected
	while http.get_status() == HTTPClient.STATUS_CONNECTING or http.get_status() == HTTPClient.STATUS_RESOLVING:
		http.poll()
#		print("Connecting.. - " + String(http.get_status()))
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
		
#		headers = http.get_response_headers_as_dictionary() # Get response headers
#		print("code: ", http.get_response_code()) # Show response code
#		print("**headers:\\n", headers) # Show headers
		
		# Getting the HTTP Body
		
#		if http.is_response_chunked():
#			# Does it use chunks?
#			print("Response is Chunked!")
#		else:
#			# Or just plain Content-Length
#			var bl = http.get_response_body_length()
#			print("Response Length: ",bl)

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

		
		var text = rb.get_string_from_ascii()
		return JSON.parse(text)
		