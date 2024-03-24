extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Skill2.scale.y = 0
	$Skill3.scale.y = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("whisper_1"):
		$Skill1.scale.y = 1
		$Skill2.scale.y = 0
		$Skill3.scale.y = 0
	if Input.is_action_just_pressed("whisper_2"):
		$Skill1.scale.y = 0
		$Skill2.scale.y = 1
		$Skill3.scale.y = 0
	if Input.is_action_just_pressed("whisper_3"):
		$Skill1.scale.y = 0
		$Skill2.scale.y = 0
		$Skill3.scale.y = 1
