extends Node2D


var locked_door_status = true
var player_has_closed_main_door_status = true
var pc_first_login = true
var pc_login_status = true
var loops_game_over = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func resetStates():
	GameManager.playerInventory = []
	locked_door_status = true
	player_has_closed_main_door_status = true
	pc_first_login = true
	pc_login_status = true
	loops_game_over = 0
