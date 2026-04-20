class_name JumpAbility extends MovementAbility

@export var jump_speed: float = 500

signal jump_started

var can_jump: bool = false
var max_jump_count = 2
var jump_count = 0

func apply_impulse(input_intent: InputIntent, _velocity, _delta) -> Vector2:
	if input_intent.jump_pressed and can_jump :
		emit_signal("jump_started")
		jump_count += 1
		print(jump_count)
		return Vector2(0, -jump_speed)
	return Vector2.ZERO

func _process(delta):
	# every frame check if can jump
	can_jump = check_if_can_jump()
	
func check_if_can_jump() -> bool:
	if GameState.player_ctx.get("is_on_floor", true):
		jump_count = 0
		
	if jump_count < max_jump_count-1: 
		return true
		
	return false
	
