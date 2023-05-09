extends Area2D


func _ready():
	pass
func _process(delta): 
	pass

func _on_Area2D_body_entered(body):
	if body.name == "personatge":
		MusicPlayer.stop()
		Global.nombre_morts += 1
		get_tree().reload_current_scene()
		
