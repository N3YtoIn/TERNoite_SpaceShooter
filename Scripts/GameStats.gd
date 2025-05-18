extends Node

var enemies_killed = 0
var speed_factor = 1.0
var last_score = 0 

func add_kill():
	enemies_killed += 1
	
	if enemies_killed % 20 == 0:
		speed_factor += 0.2
		increase_enemies_speed(speed_factor)
		
func increase_enemies_speed(factor: float):
	var enemies = get_tree().get_nodes_in_group("Enemies")
	for enemy in enemies:
		enemy.increase_speed(factor)

func reset_kills():
	last_score = enemies_killed 
	enemies_killed = 0
	speed_factor = 1.0 

func get_kills() -> int:
	return enemies_killed
