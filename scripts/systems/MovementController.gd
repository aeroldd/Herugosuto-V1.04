extends Node

@export var speed = 300;

@onready var body = get_parent()

func get_input():
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	return input_direction

func move(delta):
	if get_input() != Vector2.ZERO:
		body.velocity += get_input() * speed * delta;
	else:
		#body.get_node("FrictionComponent").apply_friction()
		pass
	#print(body.velocity)
