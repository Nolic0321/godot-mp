extends Weapon

func _ready():
	pass # Replace with function body.

remotesync func attack():
	$AnimationPlayer.play("attack")