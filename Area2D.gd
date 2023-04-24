extends Area2D


func _ready():
	pass
func _process(delta):
	pass

<<<<<<< HEAD

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	var p = get_node("/root/Joc/Personatge")
	p.position = Vector2(1,0)
=======
func _on_obstacle_escales_body_entered(body):
	if(body.is_in_group("personatge")):
		get_tree().reload_current_scene()
>>>>>>> 69225f48c5de773d9b99e11526d4b8a5deabb61a
