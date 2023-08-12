extends TileMap

var main: Node
var spawner: Spawner

func _ready() -> void:
	main = get_parent()
	spawner = Spawner.new(main)	
	spawner.set_name("spawner")
	
	add_child(spawner)

func _process(delta: float) -> void:
	$Resources.text = "Resources: " + str(main.resources) + "/" + str(main.max_resources)
	$Health.text = "Health: " + str(main.health) + "/" + str(main.max_health) 
	$Ammo.text = "Ammo: " + str(main.ammo) + "/" + str(main.max_ammo) 
	
	if (main.health <= 0):
		main.start_game()
		queue_free()

func _on_heal_pressed() -> void:
	if main.spend_resources(100):		
		main.health = main.max_health

func _on_reload_pressed() -> void:
	main.ammo = main.max_ammo

func _on_upgrade_pressed() -> void:
	if main.spend_resources(50):		
		main.max_ammo += 1
		main.max_resources += 50
		main.max_health += 5



