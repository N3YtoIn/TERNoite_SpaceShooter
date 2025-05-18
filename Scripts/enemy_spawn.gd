extends Node2D

var enemy = preload ("res://Scenes/enemy.tscn")

func _on_timer_timeout() -> void:
	var new_enemy = enemy.instantiate()
	new_enemy.global_position = global_position
	get_tree().current_scene.add_child(new_enemy)
	
	randomize()
	$Timer.wait_time = randf_range(0.5, 2.0)
	pass 
