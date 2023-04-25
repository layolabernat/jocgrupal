extends KinematicBody2D

const GRAVITY = 500
const JUMP_FORCE = -300
const MOVE_SPEED = 200

var velocity = Vector2.ZERO
var on_ground = false

onready var sprite = $Sprite
onready var raycast = $RayCast2D

func _physics_process(delta):
	# Apply gravity
	velocity.y += GRAVITY * delta

	# Move horizontally
	var input = Vector2.ZERO
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = MOVE_SPEED * input.x

	# Jump
	if on_ground and Input.is_action_pressed("ui_up"):
		velocity.y = JUMP_FORCE

	# Check for collision with ground
	var collision = raycast.get_collision()
	on_ground = collision and collision.collider.has_method("get_name") and collision.collider.get_name() == "Ground"

	# Change animation based on whether the character is on the ground
	if on_ground:
		sprite.play("run")
	else:
		sprite.play("jump")

	# Move the character
	velocity = move_and_slide(velocity, Vector2.UP)

