extends Node2D
class_name InputIntent

var move_direction: float
var jump_pressed: bool
var dash_pressed: bool
var shoot_pressed: bool
var aim_angle: float
var aim_position: Vector2

func update():
	move_direction = Input.get_axis("Left", "Right")
	dash_pressed = Input.is_action_just_pressed("Dash")
	jump_pressed = Input.is_action_just_pressed("Jump")
	shoot_pressed = Input.is_action_pressed("Shoot")

func get_angle():
	aim_position = get_global_mouse_position()
	aim_angle = (aim_position - global_position).angle()
	return aim_angle
