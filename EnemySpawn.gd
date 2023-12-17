extends Node3D

var main
var enemy_instance = load("res://space_enemy.tscn")
var node = Node3D

func _ready():
	main = get_tree().current_scene
	
func spawn():
	print("spawn")
	#Create new instance of enemy
	var enemy = enemy_instance.instantiate()
	#Add enemy to main scene
	main.add_child(enemy)
	enemy.transform.origin = transform.origin + Vector3(randf_range(-30, 30), randf_range(-20,20), 0)


func _on_timer_timeout():
	spawn()
