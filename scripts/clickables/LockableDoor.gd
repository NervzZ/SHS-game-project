extends "res://scripts/clickables/Door.gd"

@onready var gm = get_node("/root/GameManager")
@onready var announcer = get_node("/root/Announcer")

@export var keyName : String
@onready var locked : bool = isClosed
@onready var sfx_door_locked : AudioStreamPlayer2D = get_node("Door_locked")
@onready var sfx_door_unlocked : AudioStreamPlayer2D = get_node("Door_unlocked")

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
		if !sfx_door_unlocked.playing:
			sfx_door_unlocked.play()
	else:
		print("It's locked")
		announcer.announce("Bob: Hmmmm... it's locked")
		if !sfx_door_locked.playing:
			sfx_door_locked.play()
		
func unlock():
	locked = false
	
func lock():
	locked = true
