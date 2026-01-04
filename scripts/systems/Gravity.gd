extends Node

class_name GravityComponent

@export var gravity := 1200
@export var max_fall_speed := 2000

@onready var body = get_parent()

func apply_gravity(delta: float):
	# Check if the body is a character body
	if not body is CharacterBody2D:
		push_error("Gravity requires CharacterBody2D")
		
	# Apply gravity
	if not body.is_on_floor():
		var gravity_speed = gravity * delta
		body.velocity.y += min(gravity_speed, max_fall_speed)
