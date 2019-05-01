extends physics_object

export var damage = 25
export var push_strength = 15

remotesync var ready_to_pain = true

func hit(other : CharacterStats):
	if other and other.has_method("take_damage") and ready_to_pain:
		other.rpc("take_damage",damage)
		(other as KinematicBody2D).move_and_collide(((other.position - position) as Vector2).normalized() * push_strength)
		ready_to_pain = false
		$CycleActive.start()



func _on_CycleActive_timeout():
	ready_to_pain = true
	
