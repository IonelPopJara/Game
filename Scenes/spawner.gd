extends Node2D

var TIME_INTERVAL = 3

var cloud_scene_path = preload("res://Scenes/cloud.tscn")
var spawn_interval = 5  # Adjust this to change spawn interval

var currentTime = 0.0

func _process(delta):
	currentTime += delta
	
	TIME_INTERVAL = randf_range(10, 20)
	
	if (currentTime >= TIME_INTERVAL):
		currentTime = 0.0
	
		var cloud_instance = cloud_scene_path.instantiate()
		cloud_instance.position = Vector2(0, randf_range(-500, 500))  # Random Y position
		add_child(cloud_instance)
