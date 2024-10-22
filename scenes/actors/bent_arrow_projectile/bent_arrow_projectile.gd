class_name Projectile extends CharacterBody2D

const SPIN: String = "spin"

var target: CharacterBody2D
var bulletDamage: int
var speed: int = 100


func _physics_process(delta: float):
	if target != null:
		velocity = global_position.direction_to(target.global_position) * speed
		look_at(target.global_position)
		move_and_slide()
		
		$AnimatedSprite2D/Animation.play(SPIN)		

func _on_area_2d_body_entered(body: Mob) -> void:
	if "evilBlue" in body.name:
		body.health -= bulletDamage
		queue_free()
