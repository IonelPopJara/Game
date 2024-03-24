extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	#$AnimationPlayer
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimationPlayer.play("new_animation")
