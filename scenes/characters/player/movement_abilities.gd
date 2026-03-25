extends Node
class_name MovementAbilityController

var movement_abilities = []
var velocity: Vector2 #stores the calculated additional velocity to be added to the player

func _ready():
	movement_abilities = get_children()
	pass

func apply(input_intent, veloicty, delta) -> Vector2:
	velocity = Vector2.ZERO
	for ability in movement_abilities:
		velocity += ability.apply(input_intent, velocity, delta)
	return velocity
	
func update(flags):
	for ability in movement_abilities:
		ability.update(flags)
