class_name CharacterStats

extends KinematicBody2D

# Base Character Stats
export remotesync var health : int
export var attack : int
export var defense : int

puppet var slave_health : int

# Base Character Signals
signal isdying
signal health_changed

func _ready():
	# If we're not the master than this is a player that has already
	# been in the game for some time and we need to sync up their
	# existing stats with our new instance.
	if not is_network_master():
		rpc("sync_stats")
	pass

# Sync current values from the master client, as they 
# are the absolute truth, with all clients
master func sync_stats():
	rset("health",health)
	emit_signal("health_changed")

# Attack a target (other) that extends CharacterStats
func attack(other : CharacterStats):
	if other and other.has_method("take_damage"):
		other.rpc("take_damage",attack)
	
# Take damage of amount damage.
# This will only be called on the controlling client
# and will need to sync updated values with connected
# clients.
master func take_damage(damage : int):
	rset("health",health -(damage - defense))
	emit_signal("health_changed")
#	sync_stats()
	if health <= 0:
		emit_signal("isdying")