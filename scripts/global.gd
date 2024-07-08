extends Node


var score : int
var axis : Vector2
var lvl = 1


func next_lvl():
	lvl += 1
	get_tree().change_scene_to_file("scenes/mundo" + str(lvl) + ".tscn")

func get_axis() -> Vector2:
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_up")) - int(Input.is_action_pressed("ui_down"))
	return axis.normalized()
