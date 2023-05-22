extends Area2D

@onready var sprite: Sprite2D = get_node("Icon")

@export var hours = 0
@export var minutes = 0
@export var level: Levels.Levels

func _ready():
	sprite.hide()
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if (body.name == "Main Character"):
		GameManager.goto_scene(level, hours, minutes)
