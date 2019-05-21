class_name PathRunner
extends Position2D

export(float) var LERPTIME = 2.0
export(NodePath) var target_transform

enum STATES { IDLE, FOLLOW }
var _state = null
var _speed_multiplier = 3

var path = []
var start_position = Vector2()
var target_point_world = Vector2()
var target_position = Vector2()
var started_lerping
var is_lerping = false
onready var moving_target = get_node(target_transform)

var velocity = Vector2()

signal path_completed

func _ready():
	_change_state(STATES.IDLE)

func _change_state(new_state):
	_state = new_state

func traverse_path(new_path):
	path = new_path
	if not path or len(path) == 1:
		_change_state(STATES.IDLE)
		return
	# The index 0 is the starting cell
	# We need to set this as a special "start case"
	start_position = path[0]
	target_point_world = path[1]
	path.remove(0)
	_change_state(STATES.FOLLOW)

func _process(delta):
	# NPCs die here sometimes because the IDLE state is true however the
	# "path_completed" signal isn't fired or isn't received properly.  COME HERE AND FIX!
	if not _state == STATES.FOLLOW:
		return
	var arrived_to_next_point = move_to(target_point_world)
	if arrived_to_next_point:
		is_lerping = false
		start_position = path[0]
		path.remove(0)
		if len(path) == 0:
			_change_state(STATES.IDLE)
			emit_signal("path_completed")
			return
		target_point_world = path[0]

# We should look into Tweening this later
func move_to(world_position):
#	print_debug("%s is moving to %s from %s" % [moving_target.name,world_position, start_position])
	if Engine.time_scale == 0:
		return
	if(!is_lerping):
		started_lerping = OS.get_ticks_msec()
		is_lerping = true
	
	# This will eventually go to 1
	var percentCompleted = ((OS.get_ticks_msec() - started_lerping))/LERPTIME
#	percentCompleted *= _speed_multiplier
#	percentCompleted *= Engine.time_scale
	if(percentCompleted <= 1):
		moving_target.global_position = start_position.linear_interpolate(world_position,percentCompleted)
	return percentCompleted >= 1

func _on_Timer_timeout():
	pass # Replace with function body.

