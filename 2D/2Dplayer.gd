extends KinematicBody2D

func _ready():
	$Camera2D.make_current()

func _physics_process(delta):
	if Input.is_action_just_released("move_left"):
		self.global_position += Vector2(-3, 0)
	if Input.is_action_just_released("move_right"):
		self.global_position += Vector2(3, 0)
		
