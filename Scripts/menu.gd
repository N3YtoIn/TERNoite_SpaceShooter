extends Control

@onready var score_label = $LastScoreLabel

func _ready():
	score_label.text = "Last Score: %d" % GameStats.last_score
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	pass



func _on_quit_pressed():
	get_tree().quit()
	pass
