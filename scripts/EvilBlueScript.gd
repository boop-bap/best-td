extends CharacterBody2D
@export var speed = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D/animation.play("walk")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_parent().set_progress(get_parent().get_progress()+speed * delta)
	if get_parent().get_progress_ratio() == 1:
		queue_free()
