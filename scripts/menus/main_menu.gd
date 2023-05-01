extends Node2D

@export var GameScene : PackedScene


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_stat_game_button_down():
	get_tree().change_scene_to_file("res://scenes/game.tscn") 
	

func _on_exit_button_down():
	get_tree().quit()
