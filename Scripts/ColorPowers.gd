extends Area2D

@onready var sprite = $Sprite2D  # ou AnimatedSprite2D, dependendo do seu node

var blink_speed = 2.0  # velocidade do piscar (quanto maior, mais rápido)

func _process(delta):
	var alpha = 0.5 + 0.5 * sin(Time.get_ticks_msec() / 1000.0 * blink_speed * PI)
	sprite.modulate.a = alpha
