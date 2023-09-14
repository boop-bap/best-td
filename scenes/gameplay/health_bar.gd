extends Node2D

@onready var progressBar = $ProgressBar

const INITIAL_HEALTH_AMOUNT: int = 100 
var progress


func _ready():
	self.visible = false
	
func _process(delta):
	if progressBar.value != INITIAL_HEALTH_AMOUNT:
		self.visible = true
	
	var parentRotation = get_parent().get_global_transform().get_rotation()
	set_rotation(-parentRotation)
	
	progressBar.value = progress
	
	


