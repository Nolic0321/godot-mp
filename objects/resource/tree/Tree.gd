extends ResourceObject

func _ready():
	resource = load("res://resources/Wood.gd").new()
	
func interact(interactor : Object):
	var actor : Actor = interactor
	if actor and "inventory" in actor and !actor.inventory.is_full() and num_of_resources > 0:
		actor.inventory.add(resource)
		num_of_resources -= 1
		if num_of_resources == 0:
			(self as Node).queue_free()