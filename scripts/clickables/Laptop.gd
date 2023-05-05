extends "res://scripts/clickables/Clickable.gd"

@export var isOn : bool = true
var tween : Tween

@onready var obstacle : CollisionShape2D = get_node("Obstacle")


		
	
func clickedEvent():
	if tween != null:
		tween.kill()
	tween = create_tween()
	get_tree().paused = true
	$ComputerScreen.show()
