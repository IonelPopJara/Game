extends Node

var bgMusic = load("res://Sprites/bgMusic.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func playMusic():
	$AudioStreamPlayer.stream = bgMusic
	$AudioStreamPlayer.play()
