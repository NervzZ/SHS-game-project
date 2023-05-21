extends Node2D

@export var recommencer : Button
@export var indice : Button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func GameOver():
	show()
	get_tree().paused = true
