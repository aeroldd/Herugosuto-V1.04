extends Node
class_name DashController

var input_intent: InputIntent
var aiming_component: AimingComponent

@export var dash_strength = 100

func _ready() -> void:
	input_intent = get_parent().input_intent
	aiming_component = get_parent().aiming_component
	
func calculate_dash_velocity(dash_strength: float):
	var new_velocity: Vector2
	new_velocity.x = cos(aiming_component.get_angle()) * dash_strength
	new_velocity.y = sin(aiming_component.get_angle()) * dash_strength
	print("dash! velocity is" + str(new_velocity) + " aim angle is: " + str(aiming_component.get_angle()))
	
	return new_velocity
	
# Calculates the changed dash velocity if conditions are met (dash cooldown reset and dash input pressed_
func update(velocity: Vector2, dash_timer: float, dash_length: float, dash_strength: float, dash_decay: float, delta):
	# if dash timer is above 0 AND the dash button was just pressed, calculate the dash velocity
	# and return it back
	if dash_timer <= 0 and input_intent.dash_pressed:
		dash_timer = dash_length
		return calculate_dash_velocity(dash_strength)
		
	else:
		# Decriment dash timer
		dash_timer = move_toward(dash_timer, 0, delta)
		
		# decreate the dash distance somehow
		return move_toward(velocity.x, 0, dash_decay * dash_timer * delta)
		
