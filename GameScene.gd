extends Node

export var spawn_radius = 3

func _ready():
	gamestate.connect("unregister_player",self,"_delete_player")	# Listen for deleting dropped players
	pass

func spawn_entity(entity):
	var random_radius = Vector2(rand_range(-spawn_radius,spawn_radius),rand_range(-spawn_radius,spawn_radius))
	entity.position = $SpawnPosition.position + random_radius
	$Players.add_child(entity)


func _delete_player(id):
	var unregistered_player = get_node("Players/" + String(id))
	if is_instance_valid(unregistered_player):
		unregistered_player.free()
	pass
	
func _on_Timer_timeout():
	pass # replace with function body
