extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false

func _process(delta):
	var parentRotation = get_parent().get_global_transform().get_rotation()
	set_rotation(-parentRotation)

func _on_area_2d_mouse_entered():
	self.visible = true

func _on_area_2d_mouse_exited():
	self.visible = false
