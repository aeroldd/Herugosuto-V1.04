extends TileMapLayer

@export var grass_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for coords in get_used_cells():
		var tile_data = get_cell_tile_data(coords)
		
		if tile_data:
			var is_grass = tile_data.get_custom_data("is_grass")
			if is_grass:
				var grass_clump = grass_scene.instantiate()
				grass_clump.position = map_to_local(coords)
				add_child(grass_clump)
	clear_placeholder_tiles()

func clear_placeholder_tiles():
	for coords in get_used_cells():
		var tile_data = get_cell_tile_data(coords)
		if tile_data and tile_data.get_custom_data("is_grass"):
			set_cell(coords, -1) # remove tile
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
