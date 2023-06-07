extends Node2D

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
	GameManager.resume_game()
	GameManager.goto_scene(Levels.Levels.BEDROOM_LEVEL, 5, 30)
	hide()
