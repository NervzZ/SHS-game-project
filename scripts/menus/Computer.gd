extends Node2D

@export var resume : Button
@export var quit : Button
@onready var container : MarginContainer = get_node("MarginContainer")
var login : Sprite2D
var logged : bool
var loginButtons : HBoxContainer
var homeButtons : VBoxContainer

func _ready():
	var menuSize = container.get_size()
	var viewportSize = get_viewport_rect().size
	var offsetx = viewportSize.x / 2 - menuSize.x /2
	var offsety = viewportSize.y /2 - menuSize.y /2
	set_position(Vector2(offsetx, offsety))
	
	resume.button_down.connect(_on_continue_button_pressed)
	quit.button_down.connect(_on_quit_button_pressed)
	login = $MarginContainer/VBoxContainer/Login
	loginButtons = $"MarginContainer/VBoxContainer/Login Buttons"
	homeButtons = $MarginContainer/VBoxContainer/VBoxContainer
	homeButtons.hide()
	
	
func openMenu():
	show()
	get_tree().paused = true
	
	
func _on_continue_button_pressed():
	login.hide()
	$MarginContainer/VBoxContainer/Sprite2D.show()
	loginButtons.hide()
	homeButtons.show()
	get_tree().paused = true
	logged = true
	GameState.pc_first_login = false
	GameState.pc_login_status = true
	
	

func _on_quit_button_pressed():
	get_tree().paused = false
	login.show()
	hide()


func _on_quit_button_down():
	get_tree().paused = false
	logged = false
	login.show()
	loginButtons.show()
	homeButtons.hide()
	GameState.pc_login_status = false



func _on_leave_button_down():
	get_tree().paused = false
	hide() # Replace with function body.
