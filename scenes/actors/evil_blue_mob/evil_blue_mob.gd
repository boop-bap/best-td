extends CharacterBody2D

@export var speed: int = 50
var main: Node
var health = 1

const WALK_ANIMATION: String = "walk"

var focused = false

func _ready() -> void:
	main = get_tree().current_scene
	self.input_pickable = true
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

func _on_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT):
		if (focused && main.ammo > 0):
			main.ammo -= 1
			main.add_resources(10)
			queue_free()

func _on_mouse_entered():
	focused = true
func _on_mouse_exited():
	focused = false
