class_name Actor

extends CharacterStats

func _ready():
	# Connect HealthBar update with health change
	connect("health_changed",self,"update_health_bar")
	connect("isdying", self, "_is_dying")
	
	# Setup Health Bar Values
	($HealthBar as TextureProgress).max_value = health
	($HealthBar as TextureProgress).value = health
	pass

# Update the health bar to reflect current CharacterStat health
# Should only be a response from the "health_changed" signal sent by
# CharacterStats
func update_health_bar():
	rpc("_update_health_bar")
	
remotesync func _update_health_bar():
	($HealthBar as TextureProgress).value = health

puppet func _is_dying():
	print_debug("ACTOR: Is Dying")
	pass