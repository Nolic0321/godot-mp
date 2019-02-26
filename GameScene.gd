extends Node

export var spawn_radius = 3

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func spawn_entity(entity):
	var random_radius = Vector2(rand_range(-spawn_radius,spawn_radius),rand_range(-spawn_radius,spawn_radius))
	entity.position = $SpawnPosition.position + random_radius
	$Players.add_child(entity)



func _on_Timer_timeout():
	spawn_entity()
	pass # replace with function body
