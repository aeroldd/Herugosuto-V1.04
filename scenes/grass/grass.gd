extends Area2D

var grass_textures = [
	preload("res://assets/grass/grass_01.png"),
	preload("res://assets/grass/grass_02.png"),
	preload("res://assets/grass/grass_03.png"),
	preload("res://assets/grass/grass_04.png"),
	preload("res://assets/grass/grass_05.png"),
	preload("res://assets/grass/grass_06.png"),
	preload("res://assets/grass/grass_07.png"),
]

@export var grass_density: int = 5
@export var shader_material: ShaderMaterial
@export var random_factor: float = 5
@export var wind_strength: float = 5
@export var wave_frequency: float

var player_inside = false
var push: float = 0
var direction: int = 1

var grass_blades = []
func _ready() -> void:
	#
	for i in grass_density:
		# create new grass blade
		var grass_blade = Sprite2D.new()
		
		# get random texture from 1-7
		grass_blade.texture = grass_textures.pick_random()
		
		# place grass with offset
		var offset = Vector2(randf_range(-10,10), 8)
		grass_blade.offset = offset
		
		var mat = shader_material.duplicate()		
		grass_blade.material = mat
		grass_blade.material.set_shader_parameter("wind_strength", (random_factor * randf_range(-1,1) + wind_strength))
		grass_blade.material.set_shader_parameter("wave_phase", (randf_range(-1, 1)))
		
		add_child(grass_blade)
		grass_blades.append(grass_blade)
		


func _process(delta):
	pass


func _on_body_entered(body: Node2D) -> void:
	direction = sign((position.x - body.position.x ))
	push = 3* direction
	for blade in grass_blades:
		var bend = create_tween()
		bend.tween_property(
			blade.material, "shader_parameter/push", push, 0.3	
		).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
		bend.tween_property(
			blade.material, "shader_parameter/push", 0, 5	
		).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
	
