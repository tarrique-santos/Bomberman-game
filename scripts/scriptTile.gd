extends TileMapLayer

@onready var blocos = $Blocos

func _ready() -> void:
	var espacosUsados = get_used_cells()
	
	for pos in espacosUsados:
		var objeto = get_cell_source_id(pos)
		
		if objeto == 0:
			var instBloco = load("res://objects/caixa.tscn").instantiate()
			blocos.add_child(instBloco)
			
			instBloco.position = map_to_local(pos) + Vector2(tile_set.tile_size) / 2
			
			var sprite = instBloco.get_node_or_null("Sprite2D")
			
			if sprite:
				var index = randi_range(0, 3)
				sprite.region_enabled = true
				sprite.region_rect = Rect2(index * 32, 0, 32, 32)
	
	clear()
