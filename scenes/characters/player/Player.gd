extends CharacterBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$MovementController.move(delta)
	$Gravity.apply_gravity(delta)
	
	move_and_slide()
