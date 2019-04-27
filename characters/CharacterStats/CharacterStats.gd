class_name CharacterStats

extends KinematicBody2D

# Base Character Stats
export var health : int
export var attack : int
export var defense : int

# Base Character Signals
signal isdying
signal health_changed

func attack(other : CharacterStats):
	if other and other.has_method("take_damage"):
		if is_master_server()
		other.rpc("take_damage",attack)
	
master func take_damage(damage : int):
	health -= (damage - defense)
	rset("health",health)	# Set health value on other clients
	if is_network_master():
		emit_signal("health_changed")
	if health <= 0:
		emit_signal("isdying")