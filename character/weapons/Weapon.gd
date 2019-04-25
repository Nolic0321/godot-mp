class_name Weapon

extends Area2D

signal hit(body)

# Response to Physics interaction to be passed onto the "holder"
# of the weapon.  Holder will listen for the "hit" signal
func _on_Weapon_body_entered(body):
	emit_signal("hit",body)

# Executes the weapons attack animation.
func attack():
	print_debug("WEAPON: attacking...")
	pass