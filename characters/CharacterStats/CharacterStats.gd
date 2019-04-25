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
	if other:
		other.take_damage(attack)
	
func take_damage(damage : int):
	health -= (damage - defense)
	emit_signal("health_changed")
	if health <= 0:
		emit_signal("isdying")