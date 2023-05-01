extends "res://scripts/clickables/Clickable.gd"

@export var isClosed : bool = true
@export var openDegrees : float = 115
@export var openSpeed : float = 0.7
@onready var closedRotation = rotation
@onready var openRotation = closedRotation + deg_to_rad(openDegrees)
var tween : Tween

@onready var obstacle : CollisionShape2D = get_node("Obstacle")

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
		tween.tween_property(self, "rotation", openRotation, openSpeed)
		isClosed = false
		obstacle.disabled = true
	else:
		tween.tween_property(self, "rotation", closedRotation, openSpeed)
		isClosed = true
	
func _on_finished():
	if isClosed:
		obstacle.disabled = false
