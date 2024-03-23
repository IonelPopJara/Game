extends RigidBody2D
class_name MovableBlock

var move_up_speed = 100
var move_up_duration = 2.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func triggerBlock():
	print("heyo this is a test mf")
	
	# Deactivate gravity
	gravity_scale = 0.0
	# Apply upward velocity
	linear_velocity.y = -move_up_speed
	
	await get_tree().create_timer(move_up_duration).timeout
	
	# Stop the block
	linear_velocity.y = 0
