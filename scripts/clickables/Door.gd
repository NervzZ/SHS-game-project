extends "res://scripts/clickables/Clickable.gd"

@export var isOn : bool = true
var tween : Tween

@onready var obstacle : CollisionShape2D = get_node("Obstacle")


		
	
func clickedEvent():
	if tween != null:
		tween.kill()
	tween = create_tween()
	get_tree().paused = true
	if (isOn):
		turnOn()
	else:
		turnOff()
	


func turnOn():
	isOn = false
	var new_window = load("res://scenes/menus/ComputerScreen.tscn").instantiate()
	var visible_rect = get_viewport().get_visible_rect()
	new_window.position = Vector2(3000,3000)
	get_tree().get_root().add_child(new_window)


func turnOff():
	isOn = true
	var new_window = load("res://scenes/menus/ComputerScreen.tscn").instantiate()
	get_tree().get_root().add_child(new_window)
