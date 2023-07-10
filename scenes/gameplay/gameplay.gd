extends TileMap

var main: Node

func _ready():
	main = get_parent()

func _process(_delta):
	$Resources.text = "Resources: " + str(main.resources)
	$Health.text = "Health: " + str(main.health)
	
	if (main.health <= 0):
		main.start_game()
		queue_free()
