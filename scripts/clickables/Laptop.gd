extends "res://scripts/clickables/Clickable.gd"

@onready var gm = get_node("/root/GameManager")
@onready var obstacle : CollisionShape2D = get_node("Obstacle")
var computerScreen : Node2D = preload("res://scenes/menus/ComputerScreen.tscn").instantiate()

func init():
	computerScreen.hide()
	var instance = gm.UI.get_node("ComputerScreen")
	
	if (instance != null):
		instance.free()

	gm.UI.add_child(computerScreen)
	
func clickedEvent():
	computerScreen.show()
	gm.pause_game()
