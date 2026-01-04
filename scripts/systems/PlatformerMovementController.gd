extends Node

@export var speed = 300;
@export var max_speed = 500;

@export var air_speed = 150;

@export var jump_speed = 500;

@onready var body: CharacterBody2D = get_parent()

func get_direction():
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	return input_direction

func check_jump():
	if Input.is_action_just_pressed("Jump") and body.is_on_floor():
		body.velocity.y = -jump_speed;

func move(delta):
	
	if body.is_on_floor():
		# Only update the left and right directions
		body.velocity.x = get_direction().x * speed;
		body.velocity.x = min(body.velocity.x, max_speed);
	
	else:
		body.velocity.x = get_direction().x * air_speed;
		body.velocity.x = min(body.velocity.x, max_speed);
		
	#check for jumping
	check_jump()
	
	print(body.velocity)
