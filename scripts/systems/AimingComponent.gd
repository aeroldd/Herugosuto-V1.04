extends Node

class_name AimingComponent

@export var angle: float
@onready var body: CharacterBody2D = get_parent()
		
func calculate_angle():
	angle = (body.get_global_mouse_position() - body.global_position).angle()
	#print(rad_to_deg(angle))
	
func get_angle() -> float:
	return angle
