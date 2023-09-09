class_name Tower extends CharacterBody2D

const SHOOT: String = "shoot"
const bullet: PackedScene = preload("res://scenes/actors/bent_arrow_projectile/bent_arrow_projectile.tscn")

var currentTarget:CharacterBody2D
var pathToFollowName: String
var timer: Timer
var targetArray:Array[CharacterBody2D] = []

var shootingSpeed: int = 100
var shootingDelay: int = 1
var bulletDamage: int = 5

var canShoot: bool = true


func _process(delta: float) -> void:
	if is_instance_valid(currentTarget):
		look_at(currentTarget.global_position)
	else:
		for i in get_node("BulletContainer").get_child_count():
			get_node("BulletContainer").get_child(i).queue_free()

func _ready() -> void:
	initialize_timer()

func initialize_timer() -> void:
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(shootingDelay)
	timer.connect("timeout", self.on_timeout_complete)
	
	add_child(timer)

func on_timeout_complete() -> void:
	canShoot = true

func _on_tower_body_entered(body: CharacterBody2D) -> void:
	if body.name == "evilBlue":
		targetArray.push_front(body)
		var mobInArrayToShoot = targetArray.size() - 1
		
		if mobInArrayToShoot:
			currentTarget = targetArray[mobInArrayToShoot]
			pathToFollowName = body.get_node("../").get_parent().name
			
			if canShoot == true:
				$AnimatedSprite2D/Animation.play(SHOOT)
				shoot(currentTarget)

func _on_tower_body_exited(body: CharacterBody2D) -> void:
	targetArray.erase(body)

func shoot(target: CharacterBody2D) -> void:
	var tempBullet = bullet.instantiate()
	tempBullet.target = target
	
	tempBullet.bulletDamage = bulletDamage
	tempBullet.global_position = $Aim.global_position
	
	get_node("BulletContainer").add_child(tempBullet)
	
	canShoot = false
	timer.start()


