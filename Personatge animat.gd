extends KinematicBody2D

# Propietats de moviment
export var velocitat = 400
export var gravetat = 400
export var forcaSalt = 300

var velocitatX = Vector2(velocitat, 0)
var velocitatY = Vector2.ZERO
var estaAterra = false

func _physics_process(delta):
	# Capturar l'entrada d'usuari
	var moviment = Input.get_action_strength("dreta") - Input.get_action_strength("esquerra")
	var salt = Input.is_action_pressed("ves_amunt")
	
	# Moure el personatge
	velocitatX = Vector2(velocitat, 0) # Establir velocitat constant cap a la dreta
	move_and_slide(velocitatX, Vector2.UP) # Moure el personatge
	
	# Saltar
	if estaAterra and salt:
		velocitatY.y = -forcaSalt
		estaAterra = false
	
	# Aplicar la gravetat i moure verticalment
	velocitatY.y += gravetat * delta
	velocitatY = move_and_slide(velocitatY, Vector2.UP)
	if is_on_floor():
		estaAterra = true

