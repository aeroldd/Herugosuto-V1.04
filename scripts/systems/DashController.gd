class_name DashController extends MovementAbility

@export var dash_strength = 700
@export var dash_length: float = 0.2

var dash_timer: float = 0
var time

@export var decay = 1000

var dash_velocity: Vector2 = Vector2.ZERO
	
func calculate_dash_velocity(dash_strength: float, dash_angle: float) -> Vector2:
	var new_velocity: Vector2
	
	new_velocity.x = cos(dash_angle) * dash_strength
	new_velocity.y = max(sin(dash_angle) * dash_strength, -400)
	
	return new_velocity
	
func check_dash_pressed(input_intent):
	return input_intent.dash_pressed
	
# Calculates the changed dash velocity if conditions are met (dash cooldown reset and dash input pressed_
func apply(input_intent, _velocity, delta):
	if input_intent.dash_pressed:
		dash_timer = dash_length
		if dash_timer == dash_length: #just pressed dash
			var dash_angle = input_intent.get_angle()
			dash_velocity = calculate_dash_velocity(dash_strength, dash_angle)
			return dash_velocity
	dash_timer = move_toward(dash_timer, 0, delta)
	
	#slow the dash down
	dash_velocity.x = move_toward(dash_velocity.x, 0, decay)
	dash_velocity.y = move_toward(dash_velocity.y, 0, decay)
	
	return dash_velocity
