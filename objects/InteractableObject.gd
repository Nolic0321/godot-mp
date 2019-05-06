class_name InteractableObject

extends physics_object


# Mouse Hovering Listener
onready var mouse_is_hovering : bool = false

# General Interact Function; should be overwritten by inherited objects
func interact(other : Object):
	printerr("%s does not implement interact() method" % [name])

func _on_ClickableObject_mouse_entered():
	mouse_is_hovering = true


func _on_ClickableObject_mouse_exited():
	mouse_is_hovering = false