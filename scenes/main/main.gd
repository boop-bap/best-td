extends Node

var resources: int
var health: int
var game_speed_multiplier: int = 2

@onready var first_scene = preload("res://scenes/menus/main_menu.tscn")

func _ready() -> void:
	start_game()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		game_speed_multiplier = 3
	if event.is_action_released("ui_accept"):
		game_speed_multiplier = 1
	
func start_game() -> void:
	resources = 0
	health = 5
	add_child(first_scene.instantiate())

func increment_resources(multipler: int = 1):
	resources += 1 * multipler
	
# Returns true if can spend, false if not sufficient
func spend_resources(amount: int) -> bool:
	if (amount <= resources):
		resources -= amount
		return true
	else:
		return false
