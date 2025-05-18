extends Area2D

var base_speed = 100
var speed = base_speed
var is_dead = false

@onready var particles = $CPUParticles2D
@onready var screen_notifier = $VisibleOnScreenNotifier2D 

func _physics_process(delta: float) -> void:
	look_at($"../Player".global_position)
	var dir = transform.x
	global_position += dir * speed * delta

func increase_speed(factor: float):
	speed = base_speed * factor

func _on_area_entered(area: Area2D) -> void:
	if is_dead:
		return
	if area.is_in_group("Laser"):
		area.queue_free()
		if screen_notifier.is_on_screen():
			is_dead = true
			die()


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		GameStats.reset_kills() 
		await get_tree().create_timer(0.1).timeout
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func die():
	GameStats.add_kill()
	particles.emitting = true


func _on_cpu_particles_2d_finished():
	queue_free()
	pass 
