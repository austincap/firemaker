extends Spatial
var newStickPart = preload("res://NewStick.tscn")
var fireParticleScene = preload("res://FireParticle.tscn")
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	pass


func test(stick):
	var tempScale = stick.get_node("CollisionShape").scale
	if tempScale.y > 0.25:
		var newStickScene = newStickPart.instance()
		newStickScene.get_node("CollisionShape").scale = tempScale/Vector3(1, 2, 1)
		add_child(newStickScene)
		newStickScene.global_transform = stick.global_transform
		var newStickScene2 = newStickPart.instance()
		newStickScene2.get_node("CollisionShape").scale = tempScale/Vector3(1, 2, 1)
		add_child(newStickScene2)
		newStickScene2.translation = self.translation
		stick.queue_free()

func catch_fire(area):
	if not area.is_in_group("onfire"):
		var fireParticle = fireParticleScene.instance()
		#print(area.global_translate())
		#fireParticle.global_translate() = area.global_translate()
		area.add_child(fireParticle)
		area.add_to_group("onfire")
