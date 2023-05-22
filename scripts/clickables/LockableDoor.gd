extends "res://scripts/clickables/Door.gd"

@onready var announcer = get_node("/root/Announcer")

@onready var gm = get_node("/root/GameManager")

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
		lock()
		
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
	GameState.locked_door_status = false
	GameState.player_has_closed_main_door_status = true
	
func lock():
	close()
	locked = true
	GameState.player_has_closed_main_door_status = false
