extends Node

class_name GravityComponent

@export var gravity := 1000
@export var max_fall_speed := 2000

func apply_gravity(velocity: Vector2, is_on_floor: bool, delta: float) -> Vector2:
	if not is_on_floor:
		var gravity_speed = move_toward(velocity.y, max_fall_speed, gravity*delta)
		return Vector2(velocity.x ,min(gravity_speed, max_fall_speed))
	return Vector2(velocity.x, 0)
