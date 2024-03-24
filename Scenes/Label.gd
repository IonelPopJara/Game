extends Label

signal hit


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_movement_sign_body_entered(body):
	show() # Replace with function body.


func _on_movement_sign_body_exited(body):
	hide() # Replace with function body.
