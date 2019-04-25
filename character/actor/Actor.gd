class_name Actor

extends CharacterStats

func _ready():
	# Connect HealthBar update with health change
	connect("health_changed",self,"_update_health_bar")
	connect("isdying", self, "_is_dying")
	
	# Setup Health Bar Values
	$HealthBar.max_value = health
	$HealthBar.value = health
	pass

# Update the health bar to reflect current CharacterStat health
# Should only be a response from the "health_changed" signal sent by
# CharacterStats
func _update_health_bar():
	$HealthBar.value = health

func _is_dying():
	print_debug("ACTOR: Is Dying")
	pass