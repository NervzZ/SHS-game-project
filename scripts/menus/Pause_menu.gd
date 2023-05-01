extends Node2D
@export var MainMenu : PackedScene
var offset = Vector2(-960, -540)

@onready var character = ($"../Main Character")




func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = character.position + offset


func _on_continue_button_down():
	hide()
	get_tree().paused = false


func _on_quit_button_down():
	get_tree().paused = false
	get_tree().change_scene_to_packed(MainMenu)
