extends CharacterBody2D

signal hit

const SPEED = 600.0
const JUMP_VELOCITY = -1000.0
const MAX_JUMP_DELAY = 0.2
const MAX_COYOTE_DELAY = 0.1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") * 2

var elapsedTimeSinceJump = 0.0
var elapsedTimeSinceLastTouchedFloor = 0.0

func _init():
	elapsedTimeSinceJump = MAX_JUMP_DELAY

func _process(_delta):
	if Input.is_action_pressed("fire"):
		$AnimationPlayer.play("whisper")
	else:
		$AnimationPlayer.play("idle")
		
	if Input.is_action_pressed("restart"):
		die()

func _physics_process(delta):
	elapsedTimeSinceJump += delta
	
	applyGravity(delta)

	# Handle jump input
	if Input.is_action_just_pressed("jump"):
		if is_on_floor() or (!is_on_floor() and elapsedTimeSinceLastTouchedFloor < MAX_COYOTE_DELAY):
			jump()
		else:
			elapsedTimeSinceJump = 0.0
	
	# If the last time the player pressed the jump button is less than the maximum window allowed,
	# And the character is on the floor, jump
	if elapsedTimeSinceJump <= MAX_JUMP_DELAY and is_on_floor():
		jump()
		
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
		velocity.x = move_toward(velocity.x, 0, SPEED * delta * 5)

	move_and_slide()


func applyGravity(delta):
	# Add the gravity.
	if not is_on_floor():
		elapsedTimeSinceLastTouchedFloor += delta
		# If the player holds the jump button, it falls slower
		if Input.is_action_pressed("jump"):
			velocity.y += gravity * delta
		else:
		# Otherwise, if the player doesn't hold the jump button, it falls faster
			velocity.y += gravity * delta * 2
	else:
		elapsedTimeSinceLastTouchedFloor = 0.0

func jump():
	elapsedTimeSinceJump = MAX_JUMP_DELAY
	velocity.y = JUMP_VELOCITY	

func die():
	hit.emit()
	get_tree().reload_current_scene()

func _on_kill_area_2d_body_entered(_body):
	call_deferred("die")
	#die() # Replace with function body.

