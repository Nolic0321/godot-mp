class_name Sword

extends MeleeWeapon

remotesync func attack() -> void:
	$AnimationPlayer.play("attack")