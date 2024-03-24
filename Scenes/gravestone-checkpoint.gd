extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_body_entered(body):
	if body is CharacterBody2D:
		# TODO: Replace this with the win condition
		# Show next level screen
		# Go to next level
		print("Player has entered the chat")
		#print("Go to " + str(int(get_tree().current_scene.name)))
		call_deferred("next_level")

func next_level():
	var scene_name = get_tree().current_scene.name
	var next_scene_number = int(scene_name.get_slice("Level", 1)) + 1
	print("Go from " + scene_name + " to " + str(next_scene_number))
	
	if (next_scene_number < 3):
			get_tree().change_scene_to_file("res://Scenes/Level" + str(next_scene_number) + ".tscn")
