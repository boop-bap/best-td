extends TileMap

const grid_size: int = 16; # TODO get programatillcy from the grid

const inputs: Dictionary = {
	'ui_up': Vector2.UP,
	'ui_down': Vector2.DOWN,
	'ui_left': Vector2.LEFT,
	'ui_right': Vector2.RIGHT
}

func _process(delta):
	for direction in inputs.keys():
		if Input.is_action_pressed(direction):
			move(direction)

#func _unhandled_input(event: InputEvent) -> void:
#	for direction in inputs.keys():
#		if event.is_action_pressed(direction):
#			move(direction)
			
func move(direction) -> void:
	position += inputs[direction] * grid_size
