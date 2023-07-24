extends CharacterBody2D

@export var speed: int = 50
var health: int = 1
var main: Node

var focused = false

const WALK_ANIMATION: String = "walk"


func _ready() -> void:
	main = get_tree().current_scene
	self.input_pickable = true
	$AnimatedSprite2D/Animation.play(WALK_ANIMATION)

func _process(delta: float) -> void:
	get_parent().set_progress(get_parent().get_progress() + speed * delta * main.game_speed_multiplier)
	if get_parent().get_progress_ratio() > 0.995:
		main.health -= 1
		queue_free()

func _physics_process(delta) -> void:
	if health <= 0:
		death()

func death() -> void:
	# Path2D from "path_2" that is imported to the path spawner.
	var path2d = get_parent().get_parent()
	path2d.queue_free()

func _on_input_event(_viewport, event, _shape_idx) -> void:
	if (event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT):
		if (focused && main.ammo > 0):
			main.ammo -= 1
			main.add_resources(10)
			queue_free()

func _on_mouse_entered() -> void:
	focused = true
func _on_mouse_exited() -> void:
	focused = false
