extends Panel


@onready var tower = preload("res://scenes/actors/catapult_tower/catapult_tower.tscn")
var currentTower

func _on_gui_input(event):
	
	var tempTower = tower.instantiate()
	if event is InputEventMouseButton and event.button_mask == 1:
		add_child(tempTower)
		tempTower.process_mode = Node.PROCESS_MODE_DISABLED
		
	if event is InputEventMouseMotion and event.button_mask == 1:
		get_child(1).global_position = event.global_position
		
	if event is InputEventMouseButton and event.button_mask == 0:
		get_child(1).queue_free()
		var addTowerToPath = get_tree().get_root().get_node("main/worldmap/Towers")
		
		addTowerToPath.add_child(tempTower)
		tempTower.global_position = event.global_position
		tempTower.get_node("ShootArea").hide()
