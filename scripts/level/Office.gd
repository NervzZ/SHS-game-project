extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GameManager.clock.hours == 8 and GameManager.clock.minutes == 30 and GameState.locked_door_status:
		GameManager.throwGameOver("I need my badge if I want to enter the company premises. I must have left it somewhere at home.")
		
	if GameManager.clock.hours == 9 and GameManager.clock.minutes == 0 and GameState.pc_status:
		GameManager.throwGameOver("I absolutely have to log in when I arrive at the premises, otherwise the system does not understand that I have arrived at work.")
		
	if GameManager.clock.hours == 10 and GameManager.clock.minutes == 31 and GameState.player_has_closed_main_door_status:
		GameManager.throwGameOver("An intruder has entered our premises. Someone must have left the door open when they entered.")
		
	if GameManager.clock.hours == 12 and GameManager.clock.minutes == 0:
		Announcer.announce("Bob: Time to go eat")
		await get_tree().create_timer(3.0).timeout
		GameManager.goto_scene(Levels.Levels.OFFICE_LEVEL, 13, 16)
