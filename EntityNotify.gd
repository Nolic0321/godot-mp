class_name EntityNotify

extends Node2D

export var end_pos : Vector2 = position
export var notification_text : String
export var text_color : Color


func notify():
	var notify : Animation = ($AnimationPlayer as AnimationPlayer).get_animation("notify")
	
	var TEXT_POSITION_INDEX = notify.find_track("Text:rect_position")
	var COLOR_INDEX = notify.find_track("Text:custom_colors/font_color")
	# Set Text
	($Text as Label).text = notification_text
	# Set End Position
	end_pos.x += ($Text as Label).rect_position.x
	notify.track_set_key_value(TEXT_POSITION_INDEX,1,end_pos)
	# Set Starting Color
	notify.track_set_key_value(COLOR_INDEX,0,text_color)
	# Set Ending Color (a = 0)
	var end_color : Color = text_color
	end_color.a = 0
	notify.track_set_key_value(COLOR_INDEX,1,end_color)
	# Run animation
	($AnimationPlayer as AnimationPlayer).play("notify")
	pass


# Delete node upon completion as we are no longer needed
# NOTE: Should convert this to a pool in the future
func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
