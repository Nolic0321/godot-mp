extends KinematicBody2D

const MOTION_SPEED = 90.0

slave var slave_pos = Vector2()
slave var slave_motion = Vector2()



func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	pass

func _physics_process(delta):
	var motion = Vector2()
	if is_network_master():
		rset("slave_pos",position)
		if Input.is_action_pressed("move_left"):
			motion += Vector2(-1, 0)
		if Input.is_action_pressed("move_right"):
			motion += Vector2(1, 0)
		if Input.is_action_pressed("move_up"):
			motion += Vector2(0, -1)
		if Input.is_action_pressed("move_down"):
			motion += Vector2(0, 1)
			
	else:
		position = slave_pos
		
	move_and_slide(motion * MOTION_SPEED)
	if not is_network_master():
		slave_pos = position # To avoid jitter
func set_name(name):
	$Label.text = name