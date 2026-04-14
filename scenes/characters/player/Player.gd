extends CharacterBody2D
class_name Player

var movement_controller: MovementController
var aiming_component: AimingComponent
var input_intent: InputIntent
var facing_component: FacingComponent

func _ready() -> void:
	# assign the player to the game state controller
	GameState.player = self
	
	# initialise movement controller, combat controller, etc.
	movement_controller = $MovementController
	aiming_component = $AimingComponent
	input_intent = $InputIntent
	facing_component = $FacingComponent 
	
	movement_controller.set_input_intent(input_intent)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Check the state
	pass


func _physics_process(delta: float) -> void:
	input_intent.update()
	velocity = movement_controller.apply(input_intent, delta)
	facing_component.update()
	move_and_slide()
