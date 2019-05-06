class_name Actor

extends CharacterStats

# Inventory of the Actor
var inventory : Inventory

# Inventory start size
export var inventory_size : int

func _ready():
	# Connect HealthBar update with health change
	connect("health_changed",self,"update_health_bar")
	connect("isdying", self, "_is_dying")
	
	# Setup Inventory
	inventory = Inventory.new(inventory_size)
	
	# Setup Health Bar Values
	($HealthBar as TextureProgress).max_value = max_health
	_update_health_bar()
	pass

# Update the health bar to reflect current CharacterStat health
# Should only be a response from the "health_changed" signal sent by
# CharacterStats
func update_health_bar():
	rpc("_update_health_bar")
	
remotesync func _update_health_bar():
	($HealthBar as TextureProgress).value = health

puppet func _is_dying():
	print_debug("ACTOR: %s Is Dying" % [name])
	pass