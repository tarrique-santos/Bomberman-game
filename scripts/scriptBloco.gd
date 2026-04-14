extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	if randi_range(0, 100) >= 75:
		self.queue_free()
