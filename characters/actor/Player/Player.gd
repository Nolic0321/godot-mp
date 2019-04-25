extends Actor

const MOTION_SPEED = 90.0

slave var slave_pos = Vector2()
slave var slave_motion = Vector2()
slave var item_rot

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
	print_debug("PLAYER: Is Dying")
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("attack") and $Sprite/ItemSnap.get_child_count() > 0:
		($Sprite/ItemSnap.get_child(0) as Weapon).attack()
	var motion = Vector2()
	
	# If we own this object then we set movement
	if is_network_master():
		# Check for character movement
		if Input.is_action_pressed("move_left"):
			motion += Vector2(-1, 0)
		if Input.is_action_pressed("move_right"):
			motion += Vector2(1, 0)
		if Input.is_action_pressed("move_up"):
			motion += Vector2(0, -1)
		if Input.is_action_pressed("move_down"):
			motion += Vector2(0, 1)
		rset("slave_pos",position)
		
		# Rotate weapon to aim at mouse
		($Sprite/ItemSnap as Position2D).look_at(get_global_mouse_position())
		rset("item_rot",($Sprite/ItemSnap as Position2D).rotation)
		
		# Check whether or not to rotate the sprite
		_check_rotate_sprite()
	else:
		position = slave_pos
		($Sprite/ItemSnap as Position2D).rotation = item_rot
	
	move_and_slide(motion * MOTION_SPEED) # Move player object
			
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

func set_name(name):
	($Label as Label).text = name