extends Node2D

@export var resume : Button
@export var quit : Button
@onready var container : MarginContainer = get_node("MarginContainer")

func _ready():
	resume.button_down.connect(_on_continue_button_pressed)
	quit.button_down.connect(_on_quit_button_pressed)
	var menuSize = container.get_size()
	var viewportSize = get_viewport_rect().size
	var offsetx = viewportSize.x / 2 - menuSize.x /2
	var offsety = viewportSize.y /2 - menuSize.y /2
	set_position(Vector2(offsetx, offsety))
	
func openMenu():
	show()
	get_tree().paused = true
	
func _on_continue_button_pressed():
	hide()
	get_tree().paused = false


func _on_quit_button_pressed():
	get_tree().quit()
