extends KinematicBody2D

export var velocitat = 375
export var gravetat = 575

export var forcaSalt = 275

var velocitatX = Vector2(velocitat, 0)
var velocitatY = Vector2.ZERO
var estaAterra = false

func _physics_process(delta):
	
	var salt = Input.is_action_pressed("ves_amunt")
	

	velocitatX = Vector2(velocitat, 0) 
	move_and_slide(velocitatX, Vector2.UP)
	
	if is_on_floor():
		estaAterra = true
	else:
		estaAterra = false
	
	if estaAterra and salt:
		salta()
	
	
	velocitatY.y += gravetat * delta
	velocitatY = move_and_slide(velocitatY, Vector2.UP)


func _on_Area2D_body_entered(body):
	if body.name == "personatge":
		# Reinicia el joc
		get_tree().reload_current_scene()
		

func salta():
	velocitatY.y = -forcaSalt
	estaAterra = false
	var rotacio_actual = $Sprite.rotation_degrees
	$Tween.interpolate_property($Sprite, "rotation_degrees", rotacio_actual, rotacio_actual + 90, 0.5,Tween.TRANS_CUBIC)
	$Tween.start()



