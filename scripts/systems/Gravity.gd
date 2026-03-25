extends Node

class_name GravityComponent

@export var gravity := 1000
@export var max_fall_speed := 2000

func apply(velocity: Vector2, is_on_floor: bool, delta: float) -> Vector2:
	#print("is_on_floor =", is_on_floor)
	if not is_on_floor:
		var gravity_speed = move_toward(velocity.y, max_fall_speed, gravity * delta)
		#print(gravity_speed)
		return Vector2(0 ,min(gravity_speed, max_fall_speed))
	return Vector2.ZERO
