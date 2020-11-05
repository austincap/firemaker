extends Area2D

var selected = false
var notHalted = true
var timeSinceLastInput = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("mouse_entered", get_node(".."), "_on_Area2D_mouse_entered")
	self.connect("area_entered", get_node(".."), "_on_Stick_area_entered")


func _process(delta):
	timeSinceLastInput += delta
	if selected and notHalted:
		if timeSinceLastInput > 0.2:
			if Input.is_action_pressed("move_left"):
				global_position.x -= 10
			elif Input.is_action_pressed("move_right"):
				global_position.x += 10
			elif Input.is_action_pressed("move_backward"):
				global_position.y += 10
			elif Input.is_action_pressed("move_forward"):
				global_position.y -= 10
			timeSinceLastInput = 0
		if Input.is_action_just_released("rotate"):
			global_rotation_degrees += 90
		



func _on_Area2D_mouse_entered():
	print("retrieved stick")
	selected = true


func _on_Stick_area_entered(area):
	if area.is_in_group("col"):
		if area.currentNumberOfStuffInPosition > 1:
			notHalted = false
			$RigidBody2D/CollisionShape2D.disabled = false
			area.get_node("SelectionPolygon").color = Color(0.9, 0.0, 0.0, 0.4)
		else:
			area.get_node("SelectionPolygon").color = Color(0.0, 0.9, 0.0, 0.4)
			area.currentNumberOfStuffInPosition += 1


func _on_Stick_body_entered(body):
	if body.is_in_group("floor"):
		selected = false
		$RigidBody2D/CollisionShape2D.disabled = false


func _on_Stick_mouse_exited():
	selected = false
	notHalted = true


func _on_Stick_area_exited(area):
	if area.is_in_group("col"):
		notHalted = true
		area.get_node("SelectionPolygon").color = Color(0.0, 0.9, 0.0, 0.1)
		area.currentNumberOfStuffInPosition -= 1


func _on_Stick_body_exited(body):
	if body.is_in_group("floor"):
		selected = true
		$RigidBody2D/CollisionShape2D.disabled = false


