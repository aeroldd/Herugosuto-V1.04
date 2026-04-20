extends Node
class_name MovementAbilityController

var movement_abilities = []
var velocity: Vector2 #stores the calculated additional velocity to be added to the player

func _ready():
	movement_abilities = get_children()
	pass

func apply(input_intent, veloicty, delta) -> Vector2:
	var calc_velocity = Vector2.ZERO
	for ability in movement_abilities:
		calc_velocity += ability.apply(input_intent, velocity, delta)
	return calc_velocity
	
# impulse velocities override the existing one -- used for jumps
func apply_impulse(input_intent, velocity, delta) -> Vector2:
	var calc_velocity = Vector2.ZERO
	for ability in movement_abilities:
		calc_velocity += ability.apply_impulse(input_intent, velocity, delta)
	
	if calc_velocity.x == 0:
		calc_velocity = Vector2(velocity.x , calc_velocity.y)
	if calc_velocity.y == 0:
		calc_velocity = Vector2(calc_velocity.x, velocity.y)
		
	return calc_velocity
