extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Skill1")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("whisper_1"):
		$AnimationPlayer.play("Skill1")
	if Input.is_action_just_pressed("whisper_2"):
		$AnimationPlayer.play("Skill2")
	if Input.is_action_just_pressed("whisper_3"):
		$AnimationPlayer.play("Skill3")
