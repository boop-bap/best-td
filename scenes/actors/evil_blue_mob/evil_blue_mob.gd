extends CharacterBody2D

@export var speed: int = 100
var health = 1

const WALK_ANIMATION: String = "walk"
var main: Node

func _ready() -> void:
	main = get_tree().current_scene
	$AnimatedSprite2D/Animation.play(WALK_ANIMATION)

func _process(delta: float):
	
	get_parent().set_progress(get_parent().get_progress() + speed * delta * main.game_speed_multiplier)
	if get_parent().get_progress_ratio() > 0.995:
		main.health -= 1
		queue_free()
		

func _physics_process(delta):
	if health <= 0:
		death()
	
	
func death():
	get_parent().get_parent().queue_free()
