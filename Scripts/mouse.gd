extends Node2D


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	pass
	
	
	
func _process(delta: float) -> void:
	
	global_position = get_global_mouse_position()
	
	
	pass
