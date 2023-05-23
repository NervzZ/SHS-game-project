extends Node2D

@export var resume : Button
@export var quit : Button
@onready var container : MarginContainer = get_node("MarginContainer")
var login : Sprite2D
var logged : bool
var loginButtons : HBoxContainer
var homeButtons : VBoxContainer
var emailButtons : VBoxContainer

func _ready():
	var menuSize = container.get_size()
	var viewportSize = get_viewport_rect().size
	var offsetx = viewportSize.x / 2 - menuSize.x /2
	var offsety = viewportSize.y /2 - menuSize.y /2
	set_position(Vector2(offsetx, 0))
	
	resume.button_down.connect(_on_login_pressed)
	quit.button_down.connect(_on_quit_pressed)
	login = $MarginContainer/VBoxContainer/Login
	loginButtons = $"MarginContainer/VBoxContainer/Login Buttons"
	homeButtons = $"MarginContainer/VBoxContainer/Home Buttons"
	emailButtons = $"MarginContainer/VBoxContainer/Email Buttons"
	homeButtons.hide()
	
	
func openMenu():
	show()
	get_tree().paused = true
	
	

func _on_login_pressed():
	login.hide()
	$"MarginContainer/VBoxContainer/Linux Email".show()
	loginButtons.hide()
	homeButtons.hide()
	emailButtons.show()
	get_tree().paused = true
	logged = true # Replace with function body.


func _on_quit_pressed():
	get_tree().paused = false
	logged = false
	login.show()
	loginButtons.show()
	homeButtons.hide() 
	hide()# Replace with function body.


func _on_logout_pressed():
	get_tree().paused = false
	login.show()
	loginButtons.show()
	hide() # Replace with function body.


func _on_leave_pressed():
	get_tree().paused = false
	hide() # Replace with function body.
 # Replace with function body.


func _on_win_pressed():
	hide()
	GameManager.throwGameOver("Your computer has experienced a cybersecurity breach. It appears that you may have fallen victim to a malicious phishing link or a compromised USB device.")


func _on_delete_pressed():
	emailButtons.hide()
	$"MarginContainer/VBoxContainer/Linux Email".hide()
	homeButtons.show()
	$MarginContainer/VBoxContainer/Sprite2D.show()
	
	# Replace with function body.
