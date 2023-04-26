extends Node2D


@export var mainGameScene : PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_button_up():
	get_tree().change_scene_to_packed(mainGameScene) 



func _on_button_button_down():
	get_tree().quit() # Replace with function body.
