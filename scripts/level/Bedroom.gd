extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GameManager.clock.hours == 7 and GameManager.clock.minutes == 45:
		GameManager.throwGameOver("Oh shit I have to leave home before 7:45 if I want to get to work in time.")
