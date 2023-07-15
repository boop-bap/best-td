extends CharacterBody2D

var target
var speed = 1000
var pathName = ""
var bulletDamage


func _physics_process(delta):
	
	var pathSpawnerNode = get_tree().get_root().get_node("main/worldmap/PathSpawner")
	for enemy in pathSpawnerNode.get_child_count():
		if pathSpawnerNode.get_child(enemy).name == pathName:
			target = pathSpawnerNode.get_child(enemy).get_child(0).get_child(0).global_position
			
		if target != null:
			velocity = global_position.direction_to(target) *speed
			look_at(target)
			move_and_slide()
			
			
	

func _on_area_2d_body_entered(body):
	if "evilBlue" in body.name:
		body.health -= bulletDamage
		queue_free()
