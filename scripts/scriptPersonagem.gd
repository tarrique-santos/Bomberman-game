extends CharacterBody2D

const SPEED = 200
var pode_colocar_bomba = true


@export var bomb_scene: PackedScene

func _physics_process(_delta: float) -> void:
	get_input()

	move_and_slide()
	if Input.is_key_pressed(KEY_SPACE) and pode_colocar_bomba:
		place_bomb()

func get_input():
	var inputD = Input.get_vector("Esquerda", "Direita", "Cima", "Baixo")
	
	velocity = inputD * SPEED
		
func place_bomb():
	pode_colocar_bomba = false
	
	print("CRIANDO BOMBA")
	var bomb = bomb_scene.instantiate()
	bomb.position = global_position
	get_parent().add_child(bomb)
	
	await get_tree().create_timer(1.0).timeout
	pode_colocar_bomba = true
	
func _ready():
	print("PLAYER FUNCIONANDO")

func morrer():
	get_tree().change_scene_to_file("res://scenes/telaInicial.tscn")
