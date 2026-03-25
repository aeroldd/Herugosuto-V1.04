class_name JumpAbility extends MovementAbility

@export var jump_speed: float = 500

signal jump_started

func apply(input_intent: InputIntent, _velocity, _delta) -> Vector2:
	if input_intent.jump_pressed:
		emit_signal("jump_started")
		return Vector2(0, -jump_speed)
	return Vector2.ZERO
