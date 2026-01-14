extends CharacterBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$MovementController.move(delta)
	$FrictionComponent.apply_friction(delta)
	$FacingComponent.update()
	
	$DashComponent.update()
	
	$Gravity.apply_gravity(delta)
	
	$AimingComponent.calculate_angle()	
	
	move_and_slide()
	
	print(velocity)
