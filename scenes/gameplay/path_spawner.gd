extends Node2D

@onready var path: PackedScene = preload("res://scenes/gameplay/path_2.tscn")
var main: Node

func _ready() -> void:
	main = get_tree().current_scene

func _process(_delta) -> void:
	$Timer.wait_time = 1.0 / main.game_speed_multiplier

func _on_timer_timeout() -> void:
	var tempPath = path.instantiate()
	add_child(tempPath)
