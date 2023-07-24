extends Control

var main: Node

func _ready() -> void:
	main = get_tree().current_scene

func _on_play_pressed() -> void:
	var gameplay: PackedScene = load("res://scenes/gameplay/gameplay.tscn")
	var gameplay_instance: Node = gameplay.instantiate()
	main.add_child(gameplay_instance)
	print(gameplay_instance)
	queue_free()
	
func _on_high_scores_pressed() -> void:
	var score_board: PackedScene = load("res://scenes/menus/score_board.tscn")
	var score_board_instance: Node = score_board.instantiate()
	score_board_instance.Constructor(self) # pass self (main_menu) to score_board to have reference
	main.add_child(score_board_instance)
	hide()

func _on_quit_pressed() -> void:
	get_tree().quit()

