extends Node
class_name InputIntent

var move_direction
var dash_pressed
var shoot_pressed

func update():
	move_direction = Input.get_axis("Left", "Right")
	dash_pressed = Input.is_action_just_pressed("Dash")
	shoot_pressed = null
