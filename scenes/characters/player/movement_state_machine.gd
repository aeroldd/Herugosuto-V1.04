extends Node



# states!
func determine_state(states: MovementStates.States, flags: Dictionary, dash_timer: float):
	var new_state: MovementStates.States
	
	if dash_timer > 0:
		new_state = MovementStates.States.DASHING
	elif not flags["is_on_floor"]:
		new_state = MovementStates.States.FALLING
	elif flags["is_on_floor"]:
		if flags["is_controlled"]:
			new_state = MovementStates.States.RUNNING
		else:
			if flags["is_moving"]:
				new_state = MovementStates.States.SLIDING
			else:
				new_state = MovementStates.States.IDLE
	
	return new_state
