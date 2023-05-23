extends Node2D

@onready var colorRect: ColorRect = get_node("ColorRect")
@onready var container: MarginContainer = get_node("MarginContainer")

func _ready():
	var viewportSize = get_viewport_rect().size
	colorRect.set_size(viewportSize)
	container.set_size(viewportSize)
	hide()
