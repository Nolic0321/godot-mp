extends MarginContainer

export (PackedScene) var Join_Button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_list(server_list: Array):
	if server_list == null:
		pass
	for server in server_list:
		var button := Join_Button.instance() as JoinButton
		button.set_game_info(server)
		$ButtonList.add_child(button)
	pass