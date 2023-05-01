extends Node2D

@export var mainMenuScene : PackedScene

var pause_menu : Node2D = load("res://scenes/menus/Pause_menu.tscn").instantiate()
var currScene
@onready var playerSpawn : Node2D = get_node("PlayerSpawn")
var player : CharacterBody2D = load("res://scenes/actors/main_character.tscn").instantiate()
var UI : CanvasLayer = CanvasLayer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(UI)
	playerSpawn.hide()
	pause_menu.hide()
	UI.add_child(pause_menu)
	initPlayer()
	spawnPlayer()

func initPlayer():
	var camera = Camera2D.new()
	player.add_child(camera)

func resume_game():
	get_tree().paused = false

func pause_game():
	get_tree().paused = true
	
func _input(event):
	if event.is_action_pressed("escape"):
		pause_menu.openMenu()

func spawnPlayer():
	add_child(player)
	player.set_position(playerSpawn.position)
	player.set_rotation(playerSpawn.rotation)
