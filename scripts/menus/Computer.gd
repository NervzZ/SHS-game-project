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



func _on_leave_button_down():
	get_tree().paused = false
	hide() # Replace with function body.
