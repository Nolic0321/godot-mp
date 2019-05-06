extends RayCast2D

export var player_node : NodePath

master func _process(delta):
#		var attack_ray : Vector2 = get_global_mouse_position() - position
#		attack_ray = attack_ray.normalized() * radius
#		cast_to = attack_ray
		look_at(get_global_mouse_position())
		var hit = get_collider()
		if hit is InteractableObject and Input.is_action_just_pressed("attack"):
			hit.interact(get_node(player_node))