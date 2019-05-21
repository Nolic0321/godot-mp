extends Node

var rand = RandomNumberGenerator.new()

func _ready():
	rand.randomize()

func debug_client(message : String) -> void:
	print_debug("[CLIENT] " + message)

func debug_server(message : String) -> void:
	print_debug("[SERVER] " + message)

func random_in_vector2_unit_circle() -> Vector2:
	var result = Vector2(rand.randf_range(-1,1),rand.randf_range(-1,1))
	return result