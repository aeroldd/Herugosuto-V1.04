extends CharacterBody2D
class_name Player

var movement_controller: MovementController
var aiming_component: AimingComponent
var input_intent: InputIntent

func _ready() -> void:
	# initialise movement controller, combat controller, etc.
	movement_controller = $MovementController
	aiming_component = $AimingComponent
	input_intent = $InputIntent
	
	movement_controller.set_input_intent(input_intent)
	
	print(input_intent)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Check the state
	input_intent.update()
	movement_controller.update(delta)
