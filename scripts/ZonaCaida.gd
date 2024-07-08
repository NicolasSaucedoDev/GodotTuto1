extends Area2D

func _on_body_entered(body):
	if (body.get_name() == "Player"):
		print("murio")
		call_deferred("perdiste")

func perdiste():
	get_tree().reload_current_scene()
