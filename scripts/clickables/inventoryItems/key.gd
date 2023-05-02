extends "res://scripts/clickables/Clickable.gd"

@onready var gm = get_node("/root/GameManager")
@export var key_name : String = ""

func clickedEvent():
	gm.playerInventory.append(key_name)
	queue_free()
