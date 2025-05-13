extends Area2D


var speed = 100


func _physics_process(delta: float) -> void:
	
	look_at($"../Player".global_position)
	var dir = transform.x
	global_position += dir * speed * delta
	
pass


func _on_area_entered(area: Area2D) -> void:
	
	if area.is_in_group("Laser"):
		area.queue_free()
		queue_free()
	
	pass # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	
	if body.name == "Player":
		await get_tree().create_timer(0.5).timeout
		get_tree().reload_current_scene()
	
	pass # Replace with function body.
