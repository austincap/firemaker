extends Spatial

var flammabilityArray = [0, 0, 0, 0]

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	for node in self.get_children():
		if node.is_in_group("stickpart"):
			if not node.is_in_group("onfire"):
				if node.temperature > 250:
					print(node.get_name() + " is now on fire")
					get_parent().catch_fire(node)
				for overlappingNode in node.get_overlapping_areas():
					if overlappingNode.is_in_group("fire"):
						node.temperature += 5
					if overlappingNode.is_in_group("medheat"):
						node.temperature += 2
					if overlappingNode.is_in_group("lowheat"):
						node.temperature += 1
			else:
				for overlappingNode in node.get_overlapping_areas():
					if str(overlappingNode.get_parent().get_name().substr(0,8)) == "NewStick":
						pass
					else:
						if overlappingNode.is_in_group("fire"):
							node.integrity -= 5
						elif overlappingNode.is_in_group("medheat"):
							node.integrity -= 2
						elif overlappingNode.is_in_group("lowheat"):
							node.integrity -= 1
	#print($area0.get_overlapping_areas())


func _on_NewStick_body_entered(body):
	if body.is_in_group("player"):
		pass
		#get_parent().test(self)

#
#func _on_Area_area_entered(area):
#	print($area0.temperature)
#	if area.is_in_group("fire"):
#		$area0.temperature += 3
#	if area.is_in_group("heat"):
#		$area0.temperature += 1
#
#func _on_Area2_area_entered(area):
#	print($area1.temperature)
#	if area.is_in_group("fire"):
#		$area1.temperature += 3
#	if area.is_in_group("heat"):
#		$area1.temperature += 1
#
#func _on_Area3_area_entered(area):
#	print($area2.temperature)
#	if area.is_in_group("fire"):
#		$area2.temperature += 3
#	if area.is_in_group("heat"):
#		$area2.temperature += 1
#
#func _on_Area4_area_entered(area):
#	print($area3.temperature)
#	if area.is_in_group("fire"):
#		$area3.temperature += 3
#	if area.is_in_group("heat"):
#		$area3.temperature += 1


#func _on_Timer_timeout():
#	for node in self.get_children():
#		if node.is_in_group("stickpart"):
#			if node.temperature > 200:
#				get_parent().catch_fire(node)
