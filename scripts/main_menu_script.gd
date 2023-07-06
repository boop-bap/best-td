extends Control


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	
func _on_high_scores_pressed():
	get_tree().change_scene_to_file("res://scenes/score_board.tscn")

func _on_quit_pressed():
	get_tree().quit()

