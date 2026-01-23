extends Node
class_name JumpComponent

func jump(velocity: Vector2, jump_speed):
	if Input.is_action_just_pressed("Jump"):
		print("Jumped!")
		return Vector2(velocity.x, -jump_speed)
	return velocity
