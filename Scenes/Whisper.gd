class_name Whisper
extends Sprite2D

var can_fire = true
var bullet = preload("res://Scenes/bullet.tscn")

var bullet_push = preload("res://Scenes/bullet_push.tscn")
var bullet_lift = preload("res://Scenes/bullet_lift.tscn")
var bullet_grow = preload("res://Scenes/bullet_grow.tscn")

var bulletType = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	top_level = true
	bulletType = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if Input.is_action_just_pressed("whisper_1"):
		bulletType = 0
	elif Input.is_action_just_pressed("whisper_2"):
		bulletType = 1		
	elif Input.is_action_just_pressed("whisper_3"):
		bulletType = 2		
	
	position.x = lerp(position.x, get_parent().position.x, 0.5)
	position.y = lerp(position.y, get_parent().position.y + 10, 0.5)
	
	var mouse_pos = get_global_mouse_position()
	
	look_at(mouse_pos)
	
	if Input.is_action_pressed("fire") and can_fire:
		var bullet_instance
		
		if bulletType == 0:
			bullet_instance = bullet_push.instantiate()
		elif bulletType == 1:
			bullet_instance = bullet_lift.instantiate()
		else:
			bullet_instance = bullet_grow.instantiate()
		
		#var bullet_instance = bullet.instantiate()
		bullet_instance.rotation = rotation
		bullet_instance.global_position = $Marker2D.global_position
		get_parent().add_child(bullet_instance)
		can_fire = false
		await get_tree().create_timer(0.2).timeout
		can_fire = true
