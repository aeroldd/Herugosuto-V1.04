class_name CameraController extends Node2D

var random_strength: float = 10
var shake_strength: float = 0.0
var shake_fade: float = 0.2

var rng = RandomNumberGenerator.new()

@export var camera: Camera2D

var base_offset: Vector2 = Vector2.ZERO
var shake_offset: Vector2 = Vector2.ZERO

func _ready():
	var jump = $"../MovementController/MovementAbilities/JumpAbility"
	var landed = $"../MovementController"
	jump.jump_started.connect(_on_jump_started)
	landed.landed_on_floor.connect(_on_landed_on_floor)

func calculate_shake_offset() -> Vector2:
	return Vector2((rng.randf_range(-shake_strength, shake_strength)), (rng.randf_range(-shake_strength, shake_strength)))

func apply_shake(strength, decay):
	shake_strength = strength
	shake_fade = decay

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if shake_strength > 0:
		shake_strength = lerpf(shake_strength,0, shake_fade * delta)
		shake_offset = calculate_shake_offset()
	else:
		shake_offset = Vector2.ZERO
	
	# calculate offsets
	camera.offset = shake_offset + base_offset
	
	#print(camera.offset)
	
func set_base_offset(offset: Vector2):
	base_offset = offset
	
func _on_jump_started():
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_OUT)
	
	tween.tween_property(self, "base_offset:y", 1 , 0.05)
	tween.tween_property(self, "base_offset:y", -10, 0.5)
	tween.tween_property(self, "base_offset:y", 0, 0.2)
	
func _on_landed_on_floor(fall_velocity: float):
	var fall_modifier = (fall_velocity/2000)
	
	apply_shake(fall_modifier * 10,8)
	
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_OUT)
	
	tween.tween_property(self, "base_offset:y", 15 * fall_modifier , 0.3)
	tween.tween_property(self, "base_offset:y", 0, 0.5)
