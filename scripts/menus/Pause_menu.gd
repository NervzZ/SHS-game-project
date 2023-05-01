extends Node2D
@export var MainMenu : PackedScene
var offset = Vector2(-960, -540)

@export var resume : Button
@export var quit : Button

@onready var character = ($"../Main Character")


func _ready():
	resume.button_down.connect(_on_continue_button_pressed)
	quit.button_down.connect(_on_quit_button_pressed)



#faudra changer ça pour simplement lier le menu à la camera du joueur comme ça il y a jamais besoin
#de update la position
func _process(_delta):
	position = character.position + offset

func openMenu():
	show()
	get_tree().paused = true
	
func _on_continue_button_pressed():
	print("pressed")
	hide()
	get_tree().paused = false


func _on_quit_button_pressed():
	print("pressed")
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
