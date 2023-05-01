extends Node2D

@export var mainMenuScene : PackedScene

var pause_menu : Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pause_menu = $PauseMenu
	pass


func resume_game():
	get_tree().paused = false
	

func pause_game():
	get_tree().paused = true
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("escape"):
		pause_menu.show()
		pause_game()
		
		
