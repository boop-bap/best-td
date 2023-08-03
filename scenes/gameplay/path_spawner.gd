class_name Spawner extends Node2D


var path: PackedScene = preload("res://scenes/gameplay/path_2.tscn")
var main: Node
var timer: Timer


func _init(mainNode: Node) -> void:
	main = mainNode
	start_timer()
	
func start_timer() -> void:
	timer = Timer.new()
	timer.connect("timeout", self.on_timeout_complete)
	timer.autostart = true
	timer.wait_time = 1
	
	add_child(timer)
	
func on_timeout_complete() -> void:
	var tempPath = path.instantiate()
	add_child(tempPath)
	
