extends Actor

export var wander_range : float		# Wander Radius

func _ready():
	$PathRunner.connect("path_completed",self,"search_new_path")
	pathfinder.connect("path_calculated",self,"search_new_path")	# Wait for pathfinder to complete before wandering
	print_debug("%s ready for wandering" % [name])
	

func search_new_path():
	print_debug("%s is running a new path" % [name])
	var path = pathfinder.get_world_path(position,Vector2(rand_range(0,wander_range*pathfinder.map.cell_size.x),rand_range(0,wander_range*pathfinder.map.cell_size.y)))
	$PathRunner.traverse_path(path)

	
func _is_dying():
	queue_free()