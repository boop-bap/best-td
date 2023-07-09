extends Node

@onready var first_scene = preload("res://scenes/menus/main_menu.tscn")

func _ready() -> void:
	var first_scene_instance = first_scene.instantiate()
	add_child(first_scene_instance)
	
func _process(_delta: float) -> void:
	pass
	
