extends Area2D


func _ready():
	pass
func _process(delta):
	pass

func _on_obstacle_escales_body_entered(body):
	if(body.is_in_group("personatge")):
		get_tree().reload_current_scene()

