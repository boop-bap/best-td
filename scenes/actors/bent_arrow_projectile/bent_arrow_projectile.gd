extends CharacterBody2D

var target
var speed = 30
var pathName = ""
var bulletDamage

const SPIN = "spin"

func _ready() -> void:
	$AnimatedSprite2D/Animation.play(SPIN)

func _physics_process(delta):
	
	var pathSpawnerNode = get_tree().get_root().get_node("main/worldmap/PathSpawner")
	for enemy in pathSpawnerNode.get_child_count():
		if pathSpawnerNode.get_child(enemy).name == pathName:
			target = pathSpawnerNode.get_child(enemy).get_child(0).get_child(0).global_position
			
		if target != null:
			velocity = global_position.direction_to(target) * speed
			look_at(target)
			move_and_slide()
			
			
	

func _on_area_2d_body_entered(body):
	if "evilBlue" in body.name:
		body.health -= bulletDamage
		print("body.health ", body.health)
		queue_free()
