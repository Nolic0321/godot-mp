extends PopupPanel

signal respawn


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_RespawnButton_pressed():
	emit_signal("respawn")
	hide()
	pass # Replace with function body.
