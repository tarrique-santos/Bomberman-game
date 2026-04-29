extends TileMapLayer

@onready var pBlocos = $"."

func _ready() -> void:
	var espacosUsados = get_used_cells()
	
	for pos in espacosUsados:
		var obj = get_cell_source_id(pos)
		
		if obj == 0:
			var instanBloco = load("res://objects/bloco.tscn").instantiate()
			pBlocos.add_child(instanBloco)
			
			instanBloco.position = map_to_local(pos) + Vector2(tile_set.tile_size) / 2
	
	clear()
