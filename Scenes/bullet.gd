extends Area2D

@export var speed = 250
@export var velocity = Vector2(1, 0)
var initialScale = Vector2(1, 1)
var timeSinceFired = 0.0
var maxTime = 2.0  # Maximum time before bullet disappears

#var liftWhisper = preload("res://Sprites/lift-whisper.png")
#var pushWhisper = preload("res://Sprites/push-whisper.png")
#var growWhisper = preload("res://Sprites/sound.png")

func _ready():
	top_level = true

func _process(delta):
	#if Input.is_action_just_pressed("whisper_1"):
		#$AnimationPlayer.play("lift")
	#if Input.is_action_just_pressed("whisper_2"):
		#$AnimationPlayer.play("push")
	#if Input.is_action_just_pressed("whisper_3"):
		#$AnimationPlayer.play("grow")
	
	position += (Vector2.RIGHT*speed).rotated(rotation)*delta
	
	timeSinceFired += delta
	scale = initialScale * (1.0 - timeSinceFired / maxTime)
	
	if timeSinceFired >= maxTime:
		queue_free()

func _physics_process(_delta):
	await get_tree().create_timer(0.01).timeout
	set_physics_process(false)


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	if body is MovableBlock:
		body.whisperAction((Vector2.RIGHT*speed).rotated(rotation))
		queue_free()
	elif body.name != "CharacterBody2D":
		queue_free()
