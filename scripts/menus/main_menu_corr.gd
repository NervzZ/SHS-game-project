extends Node2D

@export var level : PackedScene




func _on_start_game_button_down():
	
	get_tree().change_scene_to_packed(level)
	

func _on_exit_button_down():
	get_tree().quit()
