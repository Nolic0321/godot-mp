class_name JoinButton
extends Button

var  game_name : String
var  game_ip : String
var  game_port : int

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_game_info(game_info: Dictionary):
	game_name = game_info["name"]
	game_ip = game_info["ip"]
	game_port = game_info["port"]
	
	name = game_name
	text = game_name + " : " + game_ip
	pass