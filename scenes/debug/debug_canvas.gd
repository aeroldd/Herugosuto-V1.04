extends CanvasLayer

var move_controller: MovementController
@export var dash_controller: DashController
var state_debugger: Label
var input_debugger: Label
var dash_debugger: Label
var velocity_debugger: Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	move_controller = get_parent()
	state_debugger = $StateDebugger
	input_debugger = $InputDebugger
	dash_debugger = $DashDebugger
	velocity_debugger = $VelocityDebugger
# Called every frame. 'delta' is the elapsed time since the previous frame

func _process(_delta: float) -> void:
	state_debugger.text = "Current state: " + move_controller.get_current_state_name()
	dash_debugger.text = "Dash timer: " + str(dash_controller.dash_timer)
	velocity_debugger.text = "Velocity: " +str (move_controller.velocity)
