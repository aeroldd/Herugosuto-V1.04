extends Control

@export var window: Window
var movement_controller: MovementController
var velocity_history
var max_points
@export var mode: String = "x"

@export var toggle: bool = true:
	set(n):
		_toggle(n)
		
func _toggle(n):
	visible = n
	set_physics_process(n)

func set_velocity_mode(mode: String):
	if mode == "x":
		velocity_history = movement_controller.velocity_x_history
	else:
		velocity_history = movement_controller.velocity_y_history

func _ready():
	movement_controller = window.movement_controller
	set_velocity_mode(mode)

	max_points = movement_controller.max_points	

func _draw():
	#print("hi")
	if velocity_history.size() < 2:
		return

	var width = size.x
	var height = size.y

	var max_v = 1000  # adjust based on your game
	var min_v = -1000

	for i in range(velocity_history.size() - 1):
		var x1 = float(i) / max_points * width
		var x2 = float(i + 1) / max_points * width

		var y1 = height - remap(velocity_history[i], min_v, max_v, 0, height)
		var y2 = height - remap(velocity_history[i + 1], min_v, max_v, 0, height)

		draw_line(Vector2(x1, y1), Vector2(x2, y2), Color.GREEN, 2)
		
func _physics_process(delta: float) -> void:
	queue_redraw()
