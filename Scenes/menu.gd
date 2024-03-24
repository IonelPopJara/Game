extends Control
class_name Menu

# Called when the node enters the scene tree for the first time.
func _ready():
	$"VBoxContainer/Start Button".grab_focus()
	MusicController.playMusic()

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level0.tscn")

func _on_quit_button_pressed():
	get_tree().quit()

func _on_credits_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/credits.tscn") # Replace with function body.
