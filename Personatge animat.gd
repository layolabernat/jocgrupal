extends KinematicBody2D

export var velocitat = 400
<<<<<<< HEAD
export var gravetat = 500
=======
export var gravetat = 450
>>>>>>> b3e189a44ae05a6df693a0c08555ef3fee0e6a87
export var forcaSalt = 275

var velocitatX = Vector2(velocitat, 0)
var velocitatY = Vector2.ZERO
var estaAterra = false

func _physics_process(delta):
	
	var salt = Input.is_action_pressed("ves_amunt")
	

	velocitatX = Vector2(velocitat, 0) 
	move_and_slide(velocitatX, Vector2.UP) 
	
	
	if estaAterra and salt:
		velocitatY.y = -forcaSalt
		estaAterra = false
	
	
	velocitatY.y += gravetat * delta
	velocitatY = move_and_slide(velocitatY, Vector2.UP)
	if is_on_floor():
		estaAterra = true
func _on_Area2D_body_entered(body):
	if body.name == "personatge":
		# Reinicia el joc
		get_tree().reload_current_scene()

