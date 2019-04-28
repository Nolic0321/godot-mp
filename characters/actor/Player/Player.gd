class_name Player

extends Actor

export var MOTION_SPEED = 5.0

slave var slave_pos = Vector2()
slave var slave_motion = Vector2()
slave var item_rot = 0.0
slave var slave_sprite_rotate = Vector2()

remotesync var is_alive = true

export var auto_equipped_weapon : PackedScene


func _ready():
	if is_instance_valid(auto_equipped_weapon):
		equip_weapon(auto_equipped_weapon)
	pass

# Equips new weapon on Player replacing any already equippped weapon
func equip_weapon(weapon : PackedScene):
	var new_weapon : Weapon = weapon.instance()
	# Check if a weapon is already equippped
	if $Sprite/ItemSnap.get_child_count() > 0:
		($Sprite/ItemSnap.get_child(0) as Weapon).wielder = null
		$Sprite/ItemSnap.remove_child($ItemSnap.get_child(0))	# Remove equipped item
		
	# Equip new weapon
	$Sprite/ItemSnap.add_child(new_weapon)
	
	# Hook up "Hit" signal of new weapon
	new_weapon.wielder = self
	new_weapon.connect("hit",self,"attack")

func _is_dying():
	rpc("despawn")

remotesync func despawn():
	hide()
	rset("is_alive",false)

remotesync func respawn(new_pos : Vector2) -> void:
	rset("is_alive",true)	# Enable Input
	show()	# Show the Node
	position = new_pos
	
	# Reset CharacterStats
	health = max_health
	sync_stats()

func _physics_process(delta):
	if not is_alive:
		return
	# If we own this object then we set movement
	if is_network_master():
		var velocity = Vector2()
		# Check attack input
		if Input.is_action_just_pressed("attack") and $Sprite/ItemSnap.get_child_count() > 0:
			($Sprite/ItemSnap.get_child(0) as Node).rpc("attack")
		
		# Check for character movement
		if Input.is_action_pressed("move_left"):
			velocity += Vector2(-MOTION_SPEED, 0)
		if Input.is_action_pressed("move_right"):
			velocity += Vector2(MOTION_SPEED, 0)
		if Input.is_action_pressed("move_up"):
			velocity += Vector2(0, -MOTION_SPEED)
		if Input.is_action_pressed("move_down"):
			velocity += Vector2(0, MOTION_SPEED)
		var collided_with : KinematicCollision2D = move_and_collide(velocity * delta)
		
		# Ensure that the player is within the screen size
		# NOTE: Should use a bounding box instead to save on CPU
		var window_size = OS.get_window_size()
		if position.x > window_size.x:
			position.x = window_size.x
		elif position.x < 0:
			position.x = 0
		if position.y > window_size.y:
			position.y = window_size.y
		elif position.y < 0:
			position.y = 0
			
		rset_unreliable("slave_pos",position)
		
		# Check if we collided with something and if we should hit it
		if collided_with:
			velocity = velocity.bounce(collided_with.normal)
			var character : CharacterStats = collided_with.collider
			if character and character.has_method("hit"):
				character.hit(self)
			
		# Rotate weapon to aim at mouse
		($Sprite/ItemSnap as Position2D).look_at(get_global_mouse_position())
		rset_unreliable("item_rot",($Sprite/ItemSnap as Position2D).rotation)
		
		# Check whether or not to rotate the sprite
		_check_rotate_sprite()
	else:
		# Set client object values
		position = slave_pos
		($Sprite/ItemSnap as Position2D).rotation = item_rot
		($Sprite as Sprite).scale = slave_sprite_rotate
			
	if not is_network_master():
		slave_pos = position # To avoid jitter

# Checks whether or not to flip the sprite.
# We check the angle() between the sprite and mouse position
# and if it's absolute value is greater than 1 we need to
# flip the sprite node.
func _check_rotate_sprite():
	if abs((get_global_mouse_position() - position).angle()) > 1 and ($Sprite as Sprite).scale == Vector2(1,1):
		($Sprite as Sprite).scale = Vector2(-1,1)
	elif abs((get_global_mouse_position() - position).angle()) < 1 and ($Sprite as Sprite).scale == Vector2(-1,1):
		($Sprite as Sprite).scale = Vector2(1,1)
	rset_unreliable("slave_sprite_rotate",($Sprite as Sprite).scale)

func set_name(name):
	($Label as Label).text = name

func _on_Player_body_entered(body):
	print_debug(body.name + " is entering " + name)
	pass # Replace with function body.


func _on_Player_body_exited(body):
	print_debug(body.name + " is exiting " + name)
	pass # Replace with function body.
