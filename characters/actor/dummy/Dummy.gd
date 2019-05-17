extends Actor

export var wander_range : float		# Wander Radius

func _ready():
	$PathRunner.connect("path_completed",self,"search_new_path")
	pathfinder.connect("path_calculated",self,"search_new_path")	# Wait for pathfinder to complete before wandering
	print_debug("%s ready for wandering" % [name])
	

func search_new_path() -> void:
	var new_postion = get_random_vector(wander_range*pathfinder.map.cell_size.x)
	while pathfinder.is_outside_map_bounds(pathfinder.map.world_to_map(new_postion)):
		new_postion = get_random_vector(wander_range*pathfinder.map.cell_size.x)
	var path = pathfinder.get_world_path(position,position + new_postion)
	$PathRunner.traverse_path(path)

func get_random_vector(radius : int) -> Vector2:
	return Vector2(rand_range(-radius,radius),rand_range(-radius,radius))
	
func _is_dying():
	queue_free()