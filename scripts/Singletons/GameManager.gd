extends Node2D

var loading_screen: Node2D = load("res://scenes/menus/Loading.tscn").instantiate()
var game_over_menu : Node2D = load("res://scenes/menus/Game_over.tscn").instantiate()
var pause_menu : Node2D = load("res://scenes/menus/Pause_menu.tscn").instantiate()
var currentObjectiveUi: Node2D = load("res://scenes/UI/CurrentObjective.tscn").instantiate()
var inventoryObjectiveMenu : Node2D = load("res://scenes/menus/InventoryObjectiveMenu.tscn").instantiate()
var playerSpawn : Node2D
var player : CharacterBody2D
var clock : Node2D = load("res://scenes/UI/clock.tscn").instantiate()
var UI : CanvasLayer = CanvasLayer.new()
var current_scene = null
var playerInventory : Array = []
var current_objective: String = "Go to work"

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
	UI.add_child(loading_screen)
	UI.add_child(inventoryObjectiveMenu)
	UI.add_child(currentObjectiveUi)
	goto_scene(Levels.Levels.MAIN_MENU, 5, 30)

func initPlayer():
	var camera = Camera2D.new()
	camera.set_position_smoothing_enabled(true)
	camera.set_position_smoothing_speed(10)
	player.add_child(camera)

func resume_game():
	current_scene.get_tree().paused = false

func pause_game():
	current_scene.get_tree().paused = true
	
func _input(event):
	if event.is_action_pressed("escape"):
		pause_menu.openMenu()

func spawnPlayer():
	player = load("res://scenes/actors/player/main_character.tscn").instantiate()
	initPlayer()
	current_scene.add_child(player)
	player.set_position(playerSpawn.position)
	player.set_rotation(playerSpawn.rotation)

func spawnPlayerIfExist():
	playerSpawn = current_scene.get_node("PlayerSpawn")
	if playerSpawn != null:
		playerSpawn.hide()
		spawnPlayer()

func gotoNextObjective():
	print("objective cleared")
	inventoryObjectiveMenu.nextObjective()

func throwGameOver(gameOverMessage: String):
	pause_game()
	var text = game_over_menu.get_node("MarginContainer/VBoxContainer/GameOverMessage/MarginContainer/Label")
	text.set_text(gameOverMessage)
	game_over_menu.show()
	playerInventory = []
	GameState.loops_game_over += 1
	GameState.resetGameState()
	

func goto_scene(level: int, hours : int, minutes : int):
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# This will result in a crash or unexpected behavior.

	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:

	loading_screen.show()
	await get_tree().create_timer(0.05).timeout 
	call_deferred("_deferred_goto_scene", Levels.levelPath[level])
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
	loading_screen.hide()
