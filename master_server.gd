extends Node


# Use USL for HTTP requests
var use_SSL = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Make HTTPRequest to send host information to master server
func send_server(game_name, ip, port):
	var headers = [ "Content-Type:application/json; charset=utf-8" ]
	var server_object = "{\"name\":\"" + game_name + "\",\"ip\":\"" + ip + "\",\"port\":" + String(port) + "}"
	var post = HTTPRequest.new()
	add_child(post)
	post.request("https://api.simmarith.com/nolic/server",headers,use_SSL,HTTPClient.METHOD_POST,server_object)
	
	post.connect("request_completed",self,"server_data_sent")

# Responds to sending server data
# Frees the HTTPRequest node that was created
# to elminate unecessary memory allocation
func server_data_sent(results, response_code, headers, body):
	print_debug("Server Info Sent")