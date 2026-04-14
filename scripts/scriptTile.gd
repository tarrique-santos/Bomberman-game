extends TileMapLayer

@onready var blocos = $Blocos
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var espacosUsados = self.get_used_cells()
	var quantidadeEspacos = espacosUsados.size()
	
	for i in range(quantidadeEspacos):
		var objeto = get_cell_source_id(espacosUsados[i])
		
		if objeto == 0:
			var instBloco = load("res://objects/caixa.tscn").instantiate()
			blocos.add_child(instBloco)
			instBloco.position = self.map_to_local(espacosUsados[i])
	
	self.clear();
