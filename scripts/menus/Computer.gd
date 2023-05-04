extends Node2D

@export var resume : Button
@export var quit : Button
@onready var container : MarginContainer = get_node("MarginContainer")
var login : Sprite2D
var logged : bool
var loginButtons : HBoxContainer
var homeButtons : VBoxContainer

func _ready():
	resume.button_down.connect(_on_continue_button_pressed)
	quit.button_down.connect(_on_quit_button_pressed)
	var menuSize = container.get_size()
	var viewportSize = get_viewport_rect().size
	var offsetx = viewportSize.x / 2
	var offsety = viewportSize.y /2
	position = Vector2(offsetx-600,offsety)
	login = $MarginContainer/VBoxContainer/Login
	loginButtons = $"MarginContainer/VBoxContainer/Login Buttons"
	homeButtons = $MarginContainer/VBoxContainer/VBoxContainer
	homeButtons.hide()
	
	
func openMenu():
	show()
	
	get_tree().paused = true
	
	
func _on_continue_button_pressed():
	login.hide()
	loginButtons.hide()
	homeButtons.show()
	get_tree().paused = true
	logged = true
	
	

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

