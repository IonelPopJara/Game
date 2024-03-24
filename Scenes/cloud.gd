extends Sprite2D

var speed = 50  # Adjust this to change cloud speed

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate.a8 = 80

func _process(delta):
	# Move cloud from left to right
	position.x += speed * delta
	# If cloud moves off-screen to the right, remove it
	if position.x > 10000:
		queue_free()
