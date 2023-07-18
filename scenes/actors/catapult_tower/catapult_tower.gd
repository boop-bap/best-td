extends CharacterBody2D

var bullet = preload("res://scenes/actors/bent_arrow_projectile/bent_arrow_projectile.tscn")
var bulletDamage = 5
var pathToFollowName = null
var shootingSpeed = 100
var shootingDelay = 1

var timer = null
var canShoot = true

const SHOOT = "shoot"


func _ready():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(shootingDelay)
	timer.connect("timeout", self.on_timeout_complete)
	
	add_child(timer)

func on_timeout_complete():
	canShoot = true
	
func _on_tower_body_entered(body):
	if body.name == "evilBlue":
		pathToFollowName = body.get_node("../").get_parent().name
		$AnimatedSprite2D/Animation.play(SHOOT)
		
		if canShoot == true:
			shoot()
			
		pathToFollowName = null
		
func shoot():
	var tempBullet = bullet.instantiate()
	
	tempBullet.pathName = pathToFollowName
	tempBullet.bulletDamage = bulletDamage
	tempBullet.global_position = $Aim.global_position
	
	get_node("BulletContainer").add_child(tempBullet)
	
	canShoot = false
	timer.start()
	
	
