extends VFX

func _ready():
	var jump = $"../../MovementController/MovementAbilities/JumpAbility"
	jump.jump_started.connect(_on_jump_started)
	
func _on_jump_started():
	pass
