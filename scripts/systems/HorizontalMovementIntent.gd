extends Node
class_name HorizontalMovementComponent

# Returns the calculated velocity based on the keyboard input given by the user.
@export var speed: float = 210
@export var accel: float = 3000

func apply(input_intent: InputIntent, velocity, delta) -> Vector2:
	return Vector2(move_toward(velocity.x, input_intent.move_direction * speed, accel * delta), 0)
