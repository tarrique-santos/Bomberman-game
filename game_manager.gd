extends Node

@onready var label = get_node("/root/Mapa/Label")

var inimigos_destruidos = 0

func inimigo_morreu():
	inimigos_destruidos += 1
	print("Inimigos mortos:", inimigos_destruidos)
	
	if inimigos_destruidos >= 3:
		label.text = "VOCÊ GANHOU!"
