extends CharacterBody2D

var laser = preload("res://Scenes/laser.tscn")

var spd = 300


func _physics_process(delta: float) -> void:
	
	move()
	shoot()
	
	pass


func move():
	
	var dir = transform.x
	
	velocity = dir * spd
	
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("Move"):
		move_and_slide()
	
	
	
	pass
	
	
func shoot():
	
	if Input.is_action_just_pressed("Shoot"):
		var tiro = laser.instantiate()
		tiro.global_position = $Marker2D.global_position
		get_tree().current_scene.add_child(tiro)
		
		pass
	
	
	
