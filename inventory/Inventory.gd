class_name Inventory

var maxSize : int
var inventory = []

func _init(size):
	maxSize = size

func add(item : Item):
	if item and inventory.size() < maxSize:
		inventory.append(item)

func get_item(item_name : String) -> Item:
	var item
	for i in inventory.size():
		if inventory[i].name == item_name:
			item = inventory[i]
			inventory.erase(i)
	return item	