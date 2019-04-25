extends Weapon

func _ready():
	pass # Replace with function body.

func attack():
	print_debug("FIST: attacking...")
	$AnimationPlayer.play("attack")

func debug():
	print_debug("FIST: Called debu()")