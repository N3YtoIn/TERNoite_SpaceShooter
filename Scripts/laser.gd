extends Area2D

var spd = 500

func _ready() -> void:
	look_at(get_global_mouse_position())
	pass

func _physics_process(delta: float) -> void:
	
	var dir = Vector2.RIGHT.rotated(rotation)
	global_position += dir * spd * delta
	pass
