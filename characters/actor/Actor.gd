class_name Actor

extends CharacterStats

# Inventory of the Actor
var inventory : Inventory

# Notification Packed Scene
const notify : PackedScene = preload("res://characters/actor/notify/ActorNotify.tscn")

# Inventory start size
export var inventory_size : int

# Notification Text Color
export var notif_text_color : Color = Color(1,1,1,1)

export var notif_range : int	# X-Range that Notification Can Randomly Stop at

func _ready() -> void:
	# Connect HealthBar update with health change
	connect("health_changed",self,"update_health_bar")
	connect("isdying", self, "_is_dying")
	
	# Setup Inventory
	inventory = Inventory.new(inventory_size)
	inventory.connect("item_added",self,"item_added_to_inventory")
	inventory.connect("item_removed",self, "item_removed_from_inventory")
	# Setup Health Bar Values
	($HealthBar as TextureProgress).max_value = max_health
	_update_health_bar()
	pass
	
# Response to inventory's signal 'item_added'.  We will
# simply do an actor notification
func item_added_to_inventory(name : String) -> void:
	rpc("notify","+1 " + name)
	pass
# Response to inventory's signal 'item_removed'.  We will
# simply do an actor notification
func item_removed_from_inventory(name : String) -> void:
	rpc("notify","-1 " + name)
	pass

remotesync func notify(text : String) -> void:
	# Create new notify instance
	var new_notif : EntityNotify = notify.instance()
	# Calculate end point
	var new_end : Vector2 = ($NotificationStop as Position2D).position
	new_end.x += rand_range(-notif_range,notif_range)
	# Set ActorNotify values
	new_notif.end_pos =  new_end
	new_notif.notification_text = text
	new_notif.text_color = notif_text_color
	new_notif.name = "Notification " + str($Notifications.get_child_count())
	add_child(new_notif)
	new_notif.notify()	# Run Notification

# Update the health bar to reflect current CharacterStat health
# Should only be a response from the "health_changed" signal sent by
# CharacterStats
func update_health_bar() -> void:
	rpc("_update_health_bar")
	
remotesync func _update_health_bar() -> void:
	($HealthBar as TextureProgress).value = health

puppet func _is_dying() -> void:
	print_debug("ACTOR: %s Is Dying" % [name])
	pass