extends Node2D

@export var lifetime: float = 0.5
@export var r: float = 1
@export var g: float = 1
@export var b: float = 1

func _ready() -> void:
	modulate.a = randf_range(0.6,0.9)

	modulate.b = 2
	#modulate.r = 0.2
	#modulate.g = 0.2
	
	var tween_a = create_tween()
	tween_a.tween_property(self, "modulate:a", 0.0, lifetime)
	
	var tween_size = create_tween()
	tween_size.tween_property(self, "scale", Vector2(0.7,0.95), lifetime)
	
	tween_a.tween_callback(queue_free)
	
