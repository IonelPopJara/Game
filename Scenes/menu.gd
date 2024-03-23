extends Control
class_name Menu

# Called when the node enters the scene tree for the first time.
func _ready():
	$"VBoxContainer/Start Button".grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level1.tscn")

func _on_quit_button_pressed():
	get_tree().quit()

func _on_how_to_play_button_pressed():
	pass # Replace with function body.