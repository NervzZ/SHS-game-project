extends "res://scripts/clickables/Door.gd"

@onready var gm = get_node("/root/GameManager")

@export var keyName : String
@onready var locked : bool = isClosed

func clickedEvent():
	if (isClosed):
		attemptUnlock()
		if !locked:
			if tween != null:
				tween.kill()
			tween = create_tween()
			tween.finished.connect(_on_finished)
			open()
	else:
		if tween != null:
			tween.kill()
		tween = create_tween()
		tween.finished.connect(_on_finished)
		close()
		
func playerHasKey() -> bool :
	return gm.playerInventory.find(keyName) >= 0

func attemptUnlock():
	if playerHasKey():
		print("Unlocked!")
		unlock()
	else:
		print("It's locked")
		
func unlock():
	locked = false
	
func lock():
	locked = true
