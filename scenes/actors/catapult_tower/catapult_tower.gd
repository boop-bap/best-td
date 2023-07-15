extends CharacterBody2D

var bullet = preload("res://scenes/actors/bent_arrow_projectile/bent_arrow_projectile.tscn")
var bulletDamage = 5
var pathName
var currentTargets = []
var target


	

func _on_tower_body_entered(body):
	if "evilBlue" in body.name:
		var tempArray = []
		currentTargets = get_node("Tower").get_overlapping_bodies()
		for target in currentTargets:
			if "evilBlue" in target.name:
				tempArray.append(target)
				
		var currentTarget = null
		print(tempArray)
		
		for enemy in tempArray:
			print("enemy ", enemy)
			if currentTarget == null:
				currentTarget = enemy.get_node("../")
			else:
				if enemy.get_parent().get_progress() > currentTarget.get_progress():
					currentTarget = get_node("../")
		
		
		pathName = currentTarget.get_parent().name
		
		var tempBullet = bullet.instantiate()
		tempBullet.pathName = pathName
		tempBullet.bulletDamage = bulletDamage
		
		get_node("BulletContainer").add_child(tempBullet)
		tempBullet.global_position = $Aim.global_position


@warning_ignore("unused_parameter")
func _on_tower_body_exited(body):
	pass # Replace with function body.
