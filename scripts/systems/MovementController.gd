extends Node
class_name MovementController
# This controls all movement and physics related calculations of velocit, then returns the final velocity to the main player
# which moves and slides it and applies the velocity to the character body

# Input intent controller
var input_intent: InputIntent

# State machine related variables

const states = MovementStates.States
var current_state = MovementStates.States.IDLE

# Velocity calculations related variables
@onready var horizontal_movement_component: HorizontalMovementComponent = $HorizontalMovementComponent

var velocity: Vector2

# DASHING

@export var dash_length: float = 0.1
@export var dash_strength: float = 100
@export var dash_decay: float = 10

@export var curve: Curve

# Physics components

var body: Player

var friction_component: FrictionComponent
var gravity_component: GravityComponent

var movement_abilities: MovementAbilityController 

func _ready():
	body = get_parent()

	friction_component = $FrictionComponent
	gravity_component = $GravityComponent
	movement_abilities = $MovementAbilities

# State flags
var flags = {"is_moving" = false, "is_controller" = false, "is_on_floor" = false}

# Getters and setters

func set_input_intent(intent: InputIntent):
	input_intent = intent
	
func get_current_state():
	return current_state

func get_current_state_name():
	return states.find_key(current_state)

	
func update_flags():
	flags["is_on_floor"] = body.is_on_floor()
	flags["is_controlled"] = input_intent.move_direction != 0
	flags["is_moving"] = velocity != Vector2.ZERO
	
func apply(input_intent, delta):
	update_flags()
	velocity = horizontal_movement_component.apply(input_intent, velocity, delta) + gravity_component.apply(velocity, flags["is_on_floor"], delta) + movement_abilities.apply(input_intent, velocity, delta)
		
	return velocity
	
	
# DEBUGGING STUFF
var velocity_x_history = []
var velocity_y_history = []
var time_history = []
var max_points = 200
var elapsed_time = 0.0

func _physics_process(delta):
	elapsed_time += delta
	
	add_point()
	
	#fix size of the graph
	if velocity_x_history.size() > max_points:
		velocity_x_history.pop_front()
		time_history.pop_front()
	
	if velocity_y_history.size() > max_points:
		velocity_y_history.pop_front()
		time_history.pop_front()
		
func add_point():
	velocity_x_history.append(velocity.x)
	velocity_y_history.append(velocity.y)
	time_history.append(elapsed_time)
