extends VBoxContainer

var isVisible = false

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		isVisible = !isVisible
		if isVisible:
			show()
			get_tree().paused = true
		else:
			hide()
			get_tree().paused = false


func _on_quit_button_pressed():
	get_tree().quit()


func _on_cancel_button_pressed():
	hide()
	get_tree().paused = false
