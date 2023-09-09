extends Panel

@onready var tower = preload("res://scenes/actors/catapult_tower/catapult_tower.tscn")
var currentTower


func _on_gui_input(event:InputEventMouse):
	var tempTower = tower.instantiate()
	var towerDropCordinates = event.global_position
	var validPosition = true
	
	if towerDropCordinates.x < 235 and towerDropCordinates.y > 400:
		validPosition = false
	
	if event is InputEventMouseButton and event.button_mask == 1:
		add_child(tempTower)
		tempTower.process_mode = Node.PROCESS_MODE_DISABLED
		
	elif event is InputEventMouseMotion and event.button_mask == 1:
		get_child(1).global_position = event.global_position
		
	elif event is InputEventMouseButton and event.button_mask == 0:
		get_child(1).queue_free()
		var main = get_tree().get_root().get_node("main")		
		var addTowerToPath = main.get_node("worldmap/Towers")
		
		if validPosition and main.resources >= 10:
			addTowerToPath.add_child(tempTower)
			tempTower.global_position = event.global_position
			tempTower.get_node("ShootArea").hide()
			
			main.spend_resources(10)
