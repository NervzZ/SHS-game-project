extends Node

@onready var gm = get_node("/root/GameManager")
var box: ColorRect = preload("res://scenes/UI/AnnouncerBox.tscn").instantiate()
var timer: float = 0.
var limit: int = 3

func _ready():
	box.hide()
	gm.UI.add_child(box)
	
func _process(delta):
	if timer > 0:
		if timer > limit:
			box.hide()
			timer = -1.
			
	timer += delta

func announce(message: String):
	var text: Label = box.get_node("Message")
	text.set_text(message)
	box.set_size(text.get_rect().size)
	box.call("center")
	box.show()
	timer = 0.
	
