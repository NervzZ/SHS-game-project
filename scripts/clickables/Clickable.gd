extends Node2D

@export var clickableArea : Area2D
var mouseIsHovering : bool = false

func _input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.is_action("Left Click"):
		if mouseIsHovering:
			clickedEvent()

# Called when the node enters the scene tree for the first time.
func _ready():
	init()
	clickableArea.mouse_entered.connect(on_mouse_enter)
	clickableArea.mouse_exited.connect(on_mouse_exit)

#override this to have additional initialisation logic on _ready()
func init():
	pass


#override this to define your behavior when the clickable is clicked
func clickedEvent():
	print("I have been clicked")

func on_mouse_enter():
	mouseIsHovering = true

func on_mouse_exit():
	mouseIsHovering = false
