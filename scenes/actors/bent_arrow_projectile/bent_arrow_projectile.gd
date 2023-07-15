extends CharacterBody2D

var target
var speed = 1000
var pathName = ""
var bulletDamage


func _physics_process(delta):
	
	var pathSpawnerNode = get_tree().get_root().get_node("main/worldmap/PathSpawner")
	print("pathSpawnerNode.get_child_count():", pathSpawnerNode.get_child_count())
	for i in pathSpawnerNode.get_child_count():
		print("i print ", get_child(i).name)
		print("pathName ", pathName)
		if pathSpawnerNode.get_child(i).name == pathName:
#			target = pathSpawnerNode.get_child(i).get_child(0).get_child(0).global_position
			target = pathSpawnerNode.get_child(i)
			print("pathname ", pathName)
			print("target ", target)
	
	pass
	velocity = global_position.direction_to(target) * speed

	look_at(target)
	
	move_and_slide()
	

func _on_area_2d_body_entered(body):
	if "evilBlue" in body.name:
		body.health -= bulletDamage
		queue_free()
