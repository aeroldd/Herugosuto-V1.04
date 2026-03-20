extends Node

class_name AimingComponent

@export var angle: float
@onready var body: CharacterBody2D = get_parent()
		
func get_angle():
	angle = (body.get_global_mouse_position() - body.global_position).angle()
	return angle
	#print(rad_to_deg(angle))
	
