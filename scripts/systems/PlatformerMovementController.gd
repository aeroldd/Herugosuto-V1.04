extends Node

@export var speed = 300;
@export var max_speed = 500;

@export var air_speed = 150;

@export var jump_speed = 500;
@export var acceleration = 5000;

@onready var body: CharacterBody2D = get_parent()

func get_direction():
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	return input_direction

func check_jump():
	if Input.is_action_just_pressed("Jump") and body.is_on_floor():
		body.velocity.y = -jump_speed;

func move(delta):	
	if get_direction() != Vector2.ZERO:
		if body.is_on_floor():
			body.velocity.x = move_toward(body.velocity.x, get_direction().x * speed, delta * acceleration)

		else:
			body.velocity.x = move_toward(body.velocity.x, get_direction().x * air_speed, delta * acceleration)
			
		#check for jumping
		check_jump()
	
	#print(body.velocity)
