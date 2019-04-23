class_name CharacterStats

extends KinematicBody2D

# Base Character Stats
export var health : int
export var attack : int
export var defense : int

# Base Character Signals
signal isdying

func attack(other : CharacterStats):
	other.take_damage(attack)
	
func take_damage(damage : int):
	health -= (damage - defense)
	if health <= 0:
		emit_signal("isdying")