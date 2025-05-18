extends Node2D

# Preloads dos seus power-ups
var powerup_scenes = [
	preload("res://Scenes/power_up_laser_speed.tscn"),
	preload("res://Scenes/power_up_speed.tscn")
]

# Área onde os power-ups podem aparecer (ajuste conforme seu mapa)
var spawn_area = Rect2(Vector2(100, 100), Vector2(1280, 720))

@onready var spawn_timer = $SpawnTimer

func _ready():
	spawn_timer.wait_time = 7.0  # tempo entre cada spawn
	spawn_timer.timeout.connect(_on_spawn_timer_timeout)

func _on_spawn_timer_timeout():
	var powerup_scene = powerup_scenes[randi() % powerup_scenes.size()]
	var powerup = powerup_scene.instantiate()
	
	# Gera uma posição aleatória dentro da área
	var random_pos = Vector2(
		randf_range(spawn_area.position.x, spawn_area.position.x + spawn_area.size.x),
		randf_range(spawn_area.position.y, spawn_area.position.y + spawn_area.size.y)
	)
	
	powerup.position = random_pos
	get_tree().current_scene.add_child(powerup)
