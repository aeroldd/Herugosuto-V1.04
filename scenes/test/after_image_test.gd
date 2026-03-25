extends Node2D

@export var img: PackedScene

func _input(event: InputEvent):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var node = img.instantiate()
		node.global_position = get_global_mouse_position()
		
		get_tree().current_scene.add_child(node)
	
