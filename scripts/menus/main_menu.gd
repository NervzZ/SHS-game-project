extends Node2D

@export var GameScene : PackedScene

func _on_stat_game_button_down():
	get_tree().change_scene_to_file("res://scenes/game.tscn") 
	

func _on_exit_button_down():
	get_tree().quit()
