extends Node2D

var vfxs = Array()

func _ready():
	vfxs = get_children()

func _process(delta: float):
	for vfx in vfxs:
		vfx.update_vfx(delta)
	pass
