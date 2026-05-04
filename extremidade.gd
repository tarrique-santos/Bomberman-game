extends TileMapLayer

func _ready():
	for pos in get_used_cells():
		var inst = load("res://objects/parede.tscn").instantiate()
		add_child(inst)
		inst.position = map_to_local(pos) + Vector2(tile_set.tile_size) / 2
	
	clear()
