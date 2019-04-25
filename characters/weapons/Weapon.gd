class_name Weapon

extends Area2D

var wielder : PhysicsBody2D

signal hit(body)

# Response to Physics interaction to be passed onto the "holder"
# of the weapon.  Holder will listen for the "hit" signal
func _on_Weapon_body_entered(body : PhysicsBody2D) -> void:
	if body.name == wielder.name:
		return
	emit_signal("hit",body)

# Executes the weapons attack animation.
func attack() -> void:
	push_warning(name + " doesn't have attack overwritten")
	pass