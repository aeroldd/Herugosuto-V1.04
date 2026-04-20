class_name MovementAbility extends Node

var is_active: bool = false

func apply(_input_intenet, _velocity, _delta) -> Vector2:
	return Vector2.ZERO

func apply_impulse(_input_intenet, _velocity, _delta) -> Vector2:
	return Vector2.ZERO
	
func update(_flags):
	pass
