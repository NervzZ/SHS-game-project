extends Node2D

@onready var levels = get_node("/root/Levels")
var game_over_menu : Node2D = load("res://scenes/menus/Game_over.tscn").instantiate()
var pause_menu : Node2D = load("res://scenes/menus/Pause_menu.tscn").instantiate()
var playerSpawn : Node2D
var player : CharacterBody2D = load("res://scenes/actors/player/main_character.tscn").instantiate()
var clock : Node2D = load("res://scenes/UI/clock.tscn").instantiate()
var UI : CanvasLayer = CanvasLayer.new()
var current_scene = null
var playerInventory : Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	var hotspot = Vector2(20, 1)
	Input.set_custom_mouse_cursor(load("res://graphics/UI/pointerArrow.png"), Input.CURSOR_ARROW, hotspot)
	Input.set_custom_mouse_cursor(load("res://graphics/UI/pointerHandPink.png"), Input.CURSOR_POINTING_HAND, hotspot)
	var root = get_tree().root
	pause_menu.hide()
	current_scene = root.get_child(root.get_child_count() - 1)
	add_child(UI)
	UI.add_child(pause_menu)
	UI.add_child(game_over_menu)
	UI.add_child(clock)
	initPlayer()
	goto_scene(levels.MAIN_LEVEL, 8, 32)
	print(levels.MAIN_LEVEL)

func initPlayer():
	var camera = Camera2D.new()
	camera.set_position_smoothing_enabled(true)
	camera.set_position_smoothing_speed(3)
	player.add_child(camera)

func resume_game():
	current_scene.get_tree().paused = false

func pause_game():
	current_scene.get_tree().paused = true
	
func _input(event):
	if event.is_action_pressed("escape"):
		pause_menu.openMenu()

func spawnPlayer():
	current_scene.add_child(player)
	player.set_position(playerSpawn.position)
	player.set_rotation(playerSpawn.rotation)

func spawnPlayerIfExist():
	playerSpawn = current_scene.get_node("PlayerSpawn")
	if playerSpawn != null:
		playerSpawn.hide()
		spawnPlayer()

func throwGameOver(gameOverMessage: String):
	pause_game()
	var text = game_over_menu.get_node("MarginContainer/VBoxContainer/GameOverMessage/MarginContainer/Label")
	text.set_text(gameOverMessage)
	game_over_menu.show()
	

func goto_scene(path: String, hours : int, minutes : int):
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# This will result in a crash or unexpected behavior.

	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:

	call_deferred("_deferred_goto_scene", path)
	clock.set_time(hours, minutes)
	
func _deferred_goto_scene(path):
	# It is now safe to remove the current scene
	#currScene.ready.disconnect(_on_scene_ready)
	current_scene.free()

	# Load the new scene.
	var s = ResourceLoader.load(path)

	# Instance the new scene.
	current_scene = s.instantiate()

	# Add it to the active scene, as child of root.
	get_tree().root.add_child(current_scene)

	# Optionally, to make it compatible with the SceneTree.change_scene_to_file() API.
	get_tree().current_scene = current_scene
	
	spawnPlayerIfExist()
