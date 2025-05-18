extends CanvasLayer

@onready var kill_label = $KillsLabel
@onready var timer_label = $TimerLabel

var time_passed = 0.0

func _process(delta):
	time_passed += delta
	
	if GameStats:
		kill_label.text = "Kills: %d" % GameStats.get_kills()
	else:
		kill_label.text = "Kills: N/A"
		
	_update_timer_label()

func _update_timer_label():
	var minutes = int(time_passed / 60)
	var seconds = int(time_passed) % 60
	timer_label.text = "%02d:%02d" % [minutes, seconds]
