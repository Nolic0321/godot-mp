extends Weapon

func _ready():
	pass # Replace with function body.

func attack():
	$AnimationPlayer.play("attack")