func update(delta):
	## Movement flag related stuff!
	##update_flags()
	#
	## Set variables depending on flags	
	##if is_on_floor:
		##speed = ground_speed
	##else: speed = air_speed
	#
	## Update state and update velocity based on the state
	#current_state = determine_state(dash_timer)
#
	##match current_state:
		##states.IDLE:
			##velocity = Vector2.ZERO
			##
		##states.FALLING:
			##velocity.y = gravity_component.apply_gravity(velocity, is_on_floor, delta).y
			##velocity.x = horizontal_movement_intent.calculate_horizontal_velocity(velocity, speed, accel, delta, input_intent).x
			##
		##states.SLIDING:
			##velocity = friction_component.apply_friction(velocity, delta)
			##
		##states.RUNNING:
			##velocity = horizontal_movement_intent.calculate_horizontal_velocity(velocity, speed, accel, delta, input_intent)
		##
		##states.DASHING:
			##velocity = dash_controller.update(velocity, dash_strength, dash_timer, dash_length)
			##set_dash_timer(dash_timer - (1*delta))
	##
	##if dash_controller.check_dash_pressed(input_intent):
		##set_dash_timer(dash_length)
	#
	#body.velocity = velocity
	#
	#body.move_and_slide()
	pass
