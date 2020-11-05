extends RigidBody2D

var state = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if state == 1:
		global_position = get_global_mouse_position()
		state = 0
	else:
		global_position = global_position


func _on_StickBody_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				state = 1
				print("Left button was clicked at ", event.position)
			else:
				state = 0
				print("Left button was released")
		if event.button_index == BUTTON_WHEEL_DOWN:
			print("Wheel down")
