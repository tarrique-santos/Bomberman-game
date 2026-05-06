extends Node2D

func destroy():
	var gm = get_tree().get_first_node_in_group("manager")
	
	if gm:
		gm.inimigo_morreu()
	
	queue_free()
	
