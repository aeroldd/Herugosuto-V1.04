extends Node
class_name HorizontalMovementIntent
# Returns the calculated velocity based on the keyboard input given by the user.

func get_direction():
	var direction = Input.get_axis("Left", "Right")
	return direction
	
func calculate_horizontal_velocity(velocity: Vector2, speed: float, accel: float, delta: float) -> Vector2:
	return Vector2(move_toward(velocity.x, get_direction() * speed, accel * delta), velocity.y)
