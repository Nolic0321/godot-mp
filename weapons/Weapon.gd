class_name Weapon

extends Area2D

# Whether we should be checking for hits; should be true until first hit
# then reset after the animation is completed
export var can_hit = true
# Stores reference to user so that we don't hit ourselves
var wielder : PhysicsBody2D
# Damage to apply to target
export var damage : float

signal hit(body)

# Response to Physics interaction to be passed onto the "holder"
# of the weapon.  Holder will listen for the "hit" signal
func _on_Weapon_body_entered(body : PhysicsBody2D) -> void:
	if body and body.name == wielder.name:
		return
	can_hit = false
	emit_signal("hit",body, damage)

# Executes the weapons attack animation.
func attack() -> void:
	push_warning(name + " doesn't have attack overwritten")
	pass