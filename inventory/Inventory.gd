class_name Inventory

var maxSize : int
var inventory = []

signal item_added
signal item_removed

func _init(size):
	maxSize = size

# Add an item to the inventory
func add(item : Item):
	if item and inventory.size() < maxSize:
		inventory.append(item)
		emit_signal("item_added",item.name)

# Check if the inventory is full
func is_full() -> bool:
	return inventory.size() == maxSize

# Return an item from the inventory by name
func get_item(item_name : String) -> Item:
	var item
	for i in inventory.size():
		if inventory[i].name == item_name:
			item = inventory[i]
			inventory.erase(i)
			emit_signal("item_removed",item.name)
	return item