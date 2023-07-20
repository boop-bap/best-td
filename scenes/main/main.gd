extends Node

var resources: int
var max_resources: int

var health: int
var max_health: int

var ammo: int
var max_ammo: int

var game_speed_multiplier: int = 1

@onready var first_scene = preload("res://scenes/menus/main_menu.tscn")

func _ready() -> void:
	start_game()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		game_speed_multiplier = 3
	if event.is_action_released("ui_accept"):
		game_speed_multiplier = 1
	
func start_game() -> void:
	max_resources = 100
	resources = 0
	
	max_health = 5
	health = max_health
	
	max_ammo = 2
	ammo = max_ammo
	
	add_child(first_scene.instantiate())

func add_resources(amount: int):
	resources =	clamp(resources + amount, resources,max_resources)
	
func spend_resources(amount: int) -> bool:
	if (amount <= resources):
		resources -= amount
		return true
	else:
		return false
