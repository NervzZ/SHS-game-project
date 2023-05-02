extends Node2D

@onready var text : Label = get_node("ColorRect/Time")
var minutes : int = 0
var hours : int = 0
var currElapsedTime : float = 0.



func _ready():
	var size : Vector2 = get_node("ColorRect").get_rect().size
	var screenSize : Vector2 = get_viewport_rect().size
	var offsetX = screenSize.x - size.x - 50
	var offsetY = screenSize.y - size.y - 50
	set_position(Vector2(offsetX, offsetY))

#hours are real time minutes, minutes are real time seconds
func _process(delta):
	if currElapsedTime > 1:
		minutes += 1
		currElapsedTime = 0.
	if minutes > 59:
		hours += 1
		minutes = 0
	if hours > 23:
		hours = 0
	text.text = ("%02d:%02d" % [hours, minutes])
	
	currElapsedTime += delta
	

func set_time(h: int, m: int):
	hours = h
	minutes = m
