extends Node

var main_menu: Node

func Constructor(main_menu_ref: Node) -> void:
	main_menu = main_menu_ref

func _on_button_button_down() -> void:
	main_menu.show()
	queue_free()
