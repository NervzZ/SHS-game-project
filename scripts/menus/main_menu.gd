extends Node2D

@onready var colorRect: ColorRect = get_node("ColorRect")
@onready var container: MarginContainer = get_node("MarginContainer")

func _ready():
	var viewportSize = get_viewport_rect().size
	colorRect.set_size(viewportSize)
	container.set_size(viewportSize)
	GameManager.UI.hide()
	GameManager.pause_game()
	

func _on_stat_game_button_down():
	GameManager.UI.show()
	GameState.resetStates()
	GameManager.goto_scene(Levels.Levels.BEDROOM_LEVEL, 5, 30)
	GameManager.resume_game()
	

func _on_exit_button_down():
	get_tree().quit()
