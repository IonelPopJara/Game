extends RigidBody2D
class_name MovableBlock

const MAX_SIZE = 2.0
var move_up_speed = 100
var move_up_duration = 2.0
var selected_whisper = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("whisper_1"):
		selected_whisper = 1
	if Input.is_action_just_pressed("whisper_2"):
		selected_whisper = 2
	if Input.is_action_just_pressed("whisper_3"):
		selected_whisper = 3
		
func whisperAction(direction):
	match selected_whisper:
		1:
			liftBlock()
		2:
			pushBlock(direction)
		3:
			growBlock()
	
func liftBlock():
	# Deactivate gravity
	gravity_scale = 0.0
	# Apply upward velocity
	linear_velocity.y = -move_up_speed
	
	await get_tree().create_timer(move_up_duration).timeout
	
	# Stop the block
	linear_velocity.y = 0
	
func pushBlock(direction):
	apply_central_impulse(direction)
	
func growBlock():
	if($Sprite2D.scale.x < MAX_SIZE):
		$Sprite2D.scale *= 1.05
		$CollisionShape2D.scale *= 1.05
