extends RichTextLabel

export (NodePath) onready var text_entry

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node(text_entry).connect("send_text",self,"user_text")
	
func user_text(text):
	print_debug("add_text called with " + text)
	newline()
	add_text(text)