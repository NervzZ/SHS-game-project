extends "res://scripts/clickables/Clickable.gd"

@export var isClosed : bool = true
@export var openDegrees : float = 115
@export var openSpeed : float = 0.7
@onready var closedRotation = rotation
@onready var openRotation = closedRotation + deg_to_rad(openDegrees)
var tween : Tween

@onready var obstacle : CollisionShape2D = get_node("Obstacle")
@onready var sfx_door_open : AudioStreamPlayer2D = get_node("Door_open")
@onready var sfx_door_close : AudioStreamPlayer2D = get_node("Door_close")

func init():
	if (!isClosed):
		rotation = openRotation
		obstacle.disabled = true
	
func clickedEvent():
	if tween != null:
		tween.kill()
	tween = create_tween()
	tween.finished.connect(_on_finished)
	
	if (isClosed):
		open()
	else:
		close()
	
func _on_finished():
	if isClosed:
		obstacle.disabled = false

func open():
	tween.tween_property(self, "rotation", openRotation, openSpeed)
	isClosed = false
	obstacle.disabled = true
	sfx_door_open.play()

func close():
	tween.tween_property(self, "rotation", closedRotation, openSpeed)
	isClosed = true
	sfx_door_close.play()
