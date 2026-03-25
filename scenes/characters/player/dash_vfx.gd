extends VFX

var spawn_timer: float = 0
@export var spawn_interval: float = 0.002

@export var after_image: PackedScene
@export var sprite: Sprite2D

@export var camera: CameraController
@export var shake_strength: float = 3
@export var shake_fade: float = 5

var active: bool = false

# connect all the signals from the dash controller
func _ready() -> void:
	var dash = $"../../MovementController/MovementAbilities/DashAbility"
	dash.dash_started.connect(_on_dash_started)
	dash.dash_ended.connect(_on_dash_ended)
	
func _on_dash_started():
	active = true
	sprite.modulate.inverted()
	camera.apply_shake(shake_strength, shake_fade)
	
func _on_dash_ended():
	active = false
	sprite.modulate.inverted()

func update_vfx(delta):
	if active:
		spawn_timer -= delta
		
		if spawn_timer <= 0:
			spawn_after_image()
			#print(spawn_timer)
			spawn_timer = spawn_interval
	else:
		return
	
func spawn_after_image():
	var img = after_image.instantiate()
	
	img.global_position = sprite.global_position
	img.global_rotation = sprite.global_rotation
	
	# copy texture and current frame
	img.get_node("Sprite2D").texture = sprite.texture
	img.get_node("Sprite2D").hframes = sprite.hframes
	img.get_node("Sprite2D").frame = sprite.frame
	img.get_node("Sprite2D").flip_h = sprite.flip_h
	
	get_tree().current_scene.add_child(img)
