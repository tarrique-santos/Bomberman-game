extends Node

func _on_pressed() -> void:
	print("Botão pressionado!")
	get_tree().change_scene_to_file("res://scenes/Mapa.tscn")


func _fecharJogo() -> void:
	get_tree().quit()
	pass # Replace with function body.
