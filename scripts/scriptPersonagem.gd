extends CharacterBody2D

const SPEED = 200

@onready var sprite = $AnimatedSprite2D
func _physics_process(delta: float) -> void:
	get_input()
	animate()
	move_and_slide()

func get_input():
	var inputD = Input.get_vector("Esquerda", "Direita", "Cima", "Baixo")
	
	velocity = inputD * SPEED

func animate():
	if(velocity.x > 0):
		sprite.play("lado")
		#sprite.scale = Vector2(-1, 1)
	elif(velocity.x < 0):
		sprite.play("lado")
		#sprite.scale = Vector2(1, 1)
	elif(velocity.y > 0):
		sprite.play("baixo")
		#sprite.scale = Vector2(-1, 1)
	elif(velocity.y < 0):
		sprite.play("cima")
		#sprite.scale = Vector2(-1, 1)
	else:
		sprite.pause()
