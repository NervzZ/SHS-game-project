extends Node2D

@onready var gm = get_node("/root/GameManager")
@onready var levels = get_node("/root/Levels")
@onready var continueButton : Button = get_node("MarginContainer/VBoxContainer/Controls/MarginContainer/Continue")
@onready var container : MarginContainer = get_node("MarginContainer")

func _ready():
	continueButton.button_down.connect(_on_continue_button_pressed)
	var menuSize = container.get_size()
	var viewportSize = get_viewport_rect().size
	var offsetx = viewportSize.x / 2 - menuSize.x /2
	var offsety = viewportSize.y /2 - menuSize.y /2
	set_position(Vector2(offsetx, offsety))
	hide()
	
func _on_continue_button_pressed():
	gm.resume_game()
	gm.goto_scene(levels.MAIN_LEVEL, 5, 30)
