extends "res://scripts/clickables/Clickable.gd"

@export var isClosed : bool = true
var closedRotation = rotation
var openRotation = closedRotation + deg_to_rad(115)
var tween : Tween

func init():
	if (!isClosed):
		rotation = openRotation
	
func clickedEvent():
	if tween != null:
		tween.kill()
	tween = create_tween()
	
	if (isClosed):
		tween.tween_property(self, "rotation", openRotation, 1)
		isClosed = false
	else:
		tween.tween_property(self, "rotation", closedRotation, 1)
		isClosed = true
	
