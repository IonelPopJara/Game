extends CharacterBody2D

signal hit

const SPEED = 600.0
const JUMP_VELOCITY = -1000.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")*2

func _process(delta):
	if Input.is_action_pressed("fire"):
		$AnimationPlayer.play("whisper")
	else:
		$AnimationPlayer.play("idle")
		
	if Input.is_action_pressed("restart"):
		die()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump (only if the character is on the floor!)
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Flip the sprite based on the direction
	if Input.is_action_pressed("move_left"):
		$Sprite2D.flip_h = true
	elif Input.is_action_pressed("move_right"):
		$Sprite2D.flip_h = false

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("move_left", "move_right")
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func die():
	hit.emit()
	get_tree().reload_current_scene()

func _on_kill_area_2d_body_entered(body):
	die() # Replace with function body.
