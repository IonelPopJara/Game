extends RigidBody2D
class_name MovableBlock

const MAX_SIZE = 2.0
var move_up_speed = 100
var move_up_duration = 2.0
var selected_whisper = 1

var Slide = preload("res://Sprites/slide.wav")
var Growth = preload("res://Sprites/box_growth.wav")

var canLift = true

# Called when the node enters the scene tree for the first time.
func _ready():
	contact_monitor = true
	max_contacts_reported = 2
	canLift = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
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
	if !canLift:
		return
	# Deactivate gravity
	gravity_scale = 0.0
	# Apply upward velocity
	linear_velocity.y = -move_up_speed
	
	await get_tree().create_timer(move_up_duration).timeout
	
	# Stop the block
	linear_velocity.y = 0
	
func pushBlock(direction):
	apply_central_impulse(direction * 0.5)
	$AudioStreamPlayer.stream = Slide
	$AudioStreamPlayer.play()
	
func growBlock():
	if($Sprite2D.scale.x < MAX_SIZE):
		$Sprite2D.scale *= 1.05
		$CollisionShape2D.scale *= 1.05
		$AudioStreamPlayer.stream = Growth
		$AudioStreamPlayer.play()

func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		canLift = false
		print("Player is stepping on the cube")

func _on_area_2d_body_exited(body):
	if body is CharacterBody2D:
		canLift = true
		print("Player is no longer stepping on the cube")
