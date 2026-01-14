extends Node

class_name FacingComponent

@onready var body: CharacterBody2D = get_parent()
@onready var sprite: Sprite2D = body.get_node("Sprite2D")

enum Direction {LEFT, RIGHT}
enum DirectionMode {MOUSE, MOVEMENT}

@export var direction_mode: DirectionMode = DirectionMode.MOUSE
@export var facing: Direction = Direction.LEFT

var mouse_position: Vector2

func calculate_facing_direction_mouse():
	#print(body.get_global_mouse_position())
	if body.get_global_mouse_position().x < body.global_position.x:
		facing = Direction.LEFT
	else:
		facing = Direction.RIGHT
		
func calculate_facing_direction_movement():
	if body.velocity.x < 0:
		facing = Direction.LEFT
	elif body.velocity.x > 0:
		facing = Direction.RIGHT
	else:
		facing = facing
		
func update_sprite_direction():
	if facing == Direction.LEFT:
		sprite.flip_h = true
	else:
		sprite.flip_h = false		

func update():
	if direction_mode == DirectionMode.MOUSE:
		calculate_facing_direction_mouse()
	elif direction_mode == DirectionMode.MOVEMENT:
		calculate_facing_direction_movement()
	else:
		push_error("Invalid direction mode / direction mode not set.")
		
	update_sprite_direction()
