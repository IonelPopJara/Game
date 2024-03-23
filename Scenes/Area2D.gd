extends Area2D

var moving_up = false
var move_speed = 100  # Adjust the speed of movement as needed

func _ready():
	# Connect the body_entered signal to the script
	area_entered.connect(_on_area_entered)

func _process(delta):
	if moving_up:
		$Sprite2D.position.y -= move_speed * delta

func _on_area_entered(body):
	# Check if the colliding body is the Sprite
	#if body.name == "CharacterBody2D":
		# Set moving_up flag to true to start moving up
		moving_up = true
