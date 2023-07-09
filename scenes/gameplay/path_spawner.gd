extends Node2D

@onready var path: PackedScene = preload("res://scenes/gameplay/path_2.tscn")

func _on_timer_timeout() -> void:
	var tempPath = path.instantiate()
	add_child(tempPath)
