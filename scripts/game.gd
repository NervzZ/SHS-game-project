extends Node2D

@export var mainMenuScene : PackedScene

var pause_menu_scene = load("res://scenes/menus/Pause_menu.tscn")
var pause_menu : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pause_menu = pause_menu_scene.instantiate()
	pause_menu.hide()
	add_child(pause_menu)

func resume_game():
	get_tree().paused = false

func pause_game():
	get_tree().paused = true
	
func _input(event):
	if event.is_action_pressed("escape"):
		pause_menu.openMenu()
	
