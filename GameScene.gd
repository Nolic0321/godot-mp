extends Node

export var spawn_radius = 3
master var player

func _ready():
	gamestate.connect("unregister_player",self,"_delete_player")	# Listen for deleting dropped players
	$Menus/GameOverPopup.connect("respawn",self,"respawn_player")
#	$World.connect("spawn_entity",self,"spawn_entity_at")
	pass

func spawn_entity(entity : Player):
	entity.position = _get_spawn_position()
	$Players.add_child(entity)
	if entity.is_network_master():
		entity.connect("isdying", self, "should_show_death_dialog", [int(entity.name)])
		player = entity

func _get_spawn_position() -> Vector2:
	randomize()
	return $SpawnPosition.position + Vector2(rand_range(-spawn_radius,spawn_radius),rand_range(-spawn_radius,spawn_radius))
	
func respawn_player():
	if player.has_method("respawn"):
		player.rpc("respawn", _get_spawn_position())
		
	
func should_show_death_dialog(p_id : int):
	if get_tree().get_network_unique_id() == p_id:
		($Menus/GameOverPopup as PopupPanel).popup()
	pass
	
func _delete_player(id):
	var unregistered_player = get_node("Players/" + String(id))
	if is_instance_valid(unregistered_player):
		unregistered_player.free()


func _on_World_spawn_entity(entity, spawn : Vector2):
	entity.global_position = spawn
	$Resources.add_child(entity)
	if entity is MovingNPC:
		entity.search_new_path()
	pass # Replace with function body.
