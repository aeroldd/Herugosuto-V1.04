extends Node
class_name MovementController
# This controls all movement and physics related calculations of velocit, then returns the final velocity to the main player
# which moves and slides it and applies the velocity to the character body

# State machine related variables
enum states {IDLE, RUNNING, DASHING, FALLING, SLIDING}
var current_state = states.IDLE

# Velocity calculations related variables
@onready var horizontal_movement_intent: HorizontalMovementIntent = $HorizontalMovementIntent

var speed: float
@export var ground_speed = 300
@export var air_speed = 200
var velocity: Vector2
@export var accel: float = 50

# Physics components

var body: Player
var input_intent: InputIntent

var friction_component: FrictionComponent
var gravity_component: GravityComponent
var jump_component: JumpComponent
var dash_controller: DashController
var aiming_component: AimingComponent

func _ready():
	body = get_parent()

	friction_component = $FrictionComponent
	gravity_component = $GravityComponent
	jump_component = $JumpComponent
	dash_controller = $DashController
	aiming_component = body.aiming_component

# State flags
var is_moving = false # if has velocity
var is_controlled = false # if being controlled by left or right
var is_on_floor: bool

# Dash controlling stuff
var dash_timer: float = 0

# Getters and setters

func set_input_intent(intent: InputIntent):
	input_intent = intent

# get state
func get_state(dash_timer: float):
	var new_state: states
	
	if dash_timer > 0:
		new_state = states.DASHING
	elif not is_on_floor:
		new_state = states.FALLING
	elif is_on_floor:
		if is_moving:
			if is_controlled:
				new_state = states.RUNNING
			else:
				new_state = states.SLIDING
		else:
			new_state = states.IDLE
	else:
		new_state = states.IDLE
	
	return new_state
	
func update_flags():
	is_on_floor = body.is_on_floor()
	is_controlled = check_if_controlled()
	is_moving = check_if_moving()

func check_if_controlled():
	return input_intent.move_direction != 0

func check_if_moving():
	return body.velocity != Vector2.ZERO

func update(delta):
	# Movement flag related stuff!
	update_flags()
	
	# Set variables depending on flags	
	if is_on_floor:
		speed = ground_speed
	else: speed = air_speed
	
	# Update state and update velocity based on the state
	current_state = get_state(dash_timer)

	match current_state:
		states.IDLE:
			velocity = Vector2.ZERO
			
		states.SLIDING:
			velocity = friction_component.apply_friction(velocity, delta)
			
		states.RUNNING:
			velocity = horizontal_movement_intent.calculate_horizontal_velocity(velocity, speed, accel, delta)
		
		states.DASHING:
			velocity = dash_controller.update(velocity, dash_timer, 1, 100, 1, delta)
			
	# Apply gravity
	print("is on floor_ " + str(is_on_floor))
	velocity = gravity_component.apply_gravity(velocity, is_on_floor, delta)
	velocity = jump_component.jump(velocity, 500)
	
	body.velocity = velocity
	
	$CanvasLayer.get_node("StateDebugger").text = str(current_state)
	$CanvasLayer.get_node("InputDebugger").text = str(input_intent.move_direction)
	
	print(body.velocity)
	
	body.move_and_slide()
	
