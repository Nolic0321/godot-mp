class_name ResourceObject

extends InteractableObject

# Resource to be harvested
var resource : GameResource
# Number of resources available
export var num_of_resources : int

func interact(interactor : Object):
	var actor : Actor = interactor
	if actor and "inventory" in actor and !actor.inventory.is_full():
		printerr("%s needs to implement ResourceObject.interact()" % [name])
	else:
		.interact(interactor)