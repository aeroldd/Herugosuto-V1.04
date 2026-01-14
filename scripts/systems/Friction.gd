extends Node

@onready var body: CharacterBody2D = get_parent()

@export var friction: float = 100
@export var air_resistance: float = 0.5

func apply_friction(delta):
	body.velocity.x = move_toward(body.velocity.x, 0, friction*delta)
