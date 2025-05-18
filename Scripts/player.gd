extends CharacterBody2D

var laser = preload("res://Scenes/laser.tscn")

var normal_spd = 300
var boost_spd = 700
var spd = normal_spd

var is_invincible = false

# Tiro
var laser_speed = 800
var boosted_laser_speed = 1500
var can_shoot = true
var shoot_cooldown = 0.3

@onready var invincible_timer = $InvincibleTimer
@onready var boost_timer = $BoostTimer
@onready var shoot_timer = Timer.new()

func _ready():
	add_child(shoot_timer)
	shoot_timer.wait_time = shoot_cooldown
	shoot_timer.one_shot = true
	shoot_timer.connect("timeout", Callable(self, "_on_shoot_timer_timeout"))

func _physics_process(delta: float) -> void:
	move()
	shoot()

func move():
	var dir = transform.x
	velocity = dir * spd
	look_at(get_global_mouse_position())

	if Input.is_action_pressed("Move"):
		move_and_slide()

func shoot():
	if Input.is_action_just_pressed("Shoot") and can_shoot:
		var tiro = laser.instantiate()
		tiro.global_position = $Marker2D.global_position
		tiro.rotation = rotation
		tiro.spd = laser_speed
		get_tree().current_scene.add_child(tiro)

		can_shoot = false
		shoot_timer.start()

func _on_shoot_timer_timeout():
	can_shoot = true

func _on_detector_area_entered(area):
	if area.is_in_group("SpeedPowerup"):
		spd = boost_spd
		boost_timer.start()
		area.queue_free()

	elif area.is_in_group("InvincibilityPowerup"):
		is_invincible = true
		invincible_timer.start()
		area.queue_free()

	elif area.is_in_group("SpeedLaserPowerUp"):
		activate_laser_speed_boost(5.0)
		area.queue_free()

func _on_boost_timer_timeout():
	spd = normal_spd

func _on_invincible_timer_timeout():
	is_invincible = false

func activate_laser_speed_boost(duration: float) -> void:
	laser_speed = boosted_laser_speed
	shoot_timer.wait_time = 0.1  # cooldown mais rápido durante o boost

	await get_tree().create_timer(duration).timeout

	laser_speed = 800
	shoot_timer.wait_time = shoot_cooldown  # volta ao valor original definido lá em cima
