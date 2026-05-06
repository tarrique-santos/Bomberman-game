extends Node2D

@onready var timer = $Timer


func _ready():
	timer.timeout.connect(explode)

func explode():
	create_explosion()
	queue_free()

func create_explosion():
	var directions = [
		Vector2.ZERO,
		Vector2.UP,
		Vector2.DOWN,
		Vector2.LEFT,
		Vector2.RIGHT
	]

	for dir in directions:
		var explosion = ColorRect.new()
		explosion.color = Color(1, 0.5, 0)
		explosion.size = Vector2(16, 16)
		
		var pos = position + dir * 16
		explosion.position = pos - Vector2(8, 8)

		get_parent().add_child(explosion)

		# DETECTAR E DESTRUIR BLOCO
		var space = get_world_2d().direct_space_state
		
		var query = PhysicsPointQueryParameters2D.new()
		query.position = pos
		query.collide_with_bodies = true
		query.collide_with_areas = true
		
		var result = space.intersect_point(query)

		for r in result:
			var obj = r.collider
	
			if obj and obj.get_parent() and obj.get_parent().has_method("destroy"):
				obj.get_parent().destroy()
		
			if obj and obj.is_in_group("player"):
				obj.morrer()
				return  # 💥 PARA TUDO AQUI
	
			if obj and obj.get_parent() and obj.get_parent().has_method("destroy"):
				obj.get_parent().destroy()
		
			if obj and obj.is_in_group("player"):
				obj.morrer()

			
		# TIMER PRA SUMIR
		var t = Timer.new()
		t.wait_time = 0.3
		t.one_shot = true
		t.autostart = true

		explosion.add_child(t)
		t.timeout.connect(func(): explosion.queue_free());
		
