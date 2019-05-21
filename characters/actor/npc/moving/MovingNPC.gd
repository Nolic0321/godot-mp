class_name MovingNPC
extends NPC

export var wander_range : float		# Wander Radius in map units

var rand := RandomNumberGenerator.new()

func _ready():
	$PathRunner.connect("path_completed",self,"search_new_path")
	rand.randomize()
	

func search_new_path() -> void:
	var new_postion : Vector2 = Vector2(rand.randi_range(-1,1),rand.randi_range(-1,1))
	var current_cell_pos : Vector2 = pathfinder.map.world_to_map(global_position)
	print_debug("%s NEWPATH: new position = %s" % [name, new_postion])
	while pathfinder.is_outside_map_bounds(current_cell_pos + new_postion):
		print_debug("%s NEWPATH: OUTSIDE OF BOUNDS new position = %s" % [name, current_cell_pos + new_postion])
		new_postion = Vector2(rand.randi_range(-1,1),rand.randi_range(-1,1))
		print_debug("%s NEWPATH: new position = %s" % [name, new_postion])
	var path = pathfinder.get_world_path(global_position,pathfinder.map.map_to_world(current_cell_pos + new_postion))
	($PathRunner as PathRunner).traverse_path(path)
	
	