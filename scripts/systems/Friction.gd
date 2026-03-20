extends Node

class_name FrictionComponent

@export var friction: float = 100
@export var air_resistance: float = 0.5

func apply(velocity: Vector2, delta) -> Vector2:
	return Vector2(move_toward(velocity.x, 0, friction * delta), velocity.y)
