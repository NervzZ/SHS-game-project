extends "res://scripts/clickables/Clickable.gd"

@onready var gm = get_node("/root/GameManager")
@onready var obstacle : CollisionShape2D = get_node("Obstacle")
var computerScreenWithEmail : Node2D = preload("res://scenes/menus/ComputerScreenWithEmail.tscn").instantiate()

func init():
	computerScreenWithEmail.hide()
	gm.UI.add_child(computerScreenWithEmail)
	
func clickedEvent():
	computerScreenWithEmail.show()
	gm.pause_game()
