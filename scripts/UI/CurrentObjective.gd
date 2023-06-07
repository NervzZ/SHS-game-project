extends Node2D

@onready var colorRect: ColorRect = get_node("ColorRect")
@onready var container: MarginContainer = get_node("MarginContainer")
@onready var label: Label = get_node("MarginContainer/VBoxContainer/Name")

# Called when the node enters the scene tree for the first time.
func _ready():
	setObjective("Go to work")
	var viewportSize = get_viewport_rect().size
	set_position(Vector2(viewportSize.y * 0.05, viewportSize.y * 0.05))

func setObjective(name):
	if (name != null):
		label.set_text(name)
	else:
		label.set_text("no objectives")
	colorRect.set_size(container.get_size())
