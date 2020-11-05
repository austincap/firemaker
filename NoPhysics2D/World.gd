extends Node2D

var selected_stick

func _ready():
	$Camera2D.make_current()


func _process(delta):
	pass

func _on_Area2D_mouse_entered():
	pass#print("retrieved world")

func _on_Stick_area_entered():
	pass#print("world heard stick entered area")
