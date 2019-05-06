class_name ResourceObject

extends InteractableObject

# Resource to be harvested
var resource : GameResource
# Number of resources available
export var num_of_resources : int

func _ready():
	setup_check()

master func setup_check():
	if resource == null:
		printerr("%s does not have a resource assigned" % [name])

func interact(interactor : Object):
	var actor : Actor = interactor
	if actor and "inventory" in actor:
		printerr("%s needs to implement ResourceObject.interact()" % [name])
	else:
		.interact(interactor)