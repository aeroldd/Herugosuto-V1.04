extends Node

# This component needs to be attached to a parent with an AimingComponent attached to it.

var body: CharacterBody2D
var aiming_component: AimingComponent

@export var dash_strength = 100

func _ready() -> void:
	body = get_parent()
	aiming_component = body.get_node("AimingComponent")

func update():
	if Input.is_action_just_pressed("Dash"):
		dash()
		
func dash():
	body.velocity.x = cos(aiming_component.get_angle()) * dash_strength
	body.velocity.y = sin(aiming_component.get_angle()) * dash_strength
	print("dash! velocity is" + str(body.velocity) + " aim angle is: " + str(aiming_component.get_angle()))
	
