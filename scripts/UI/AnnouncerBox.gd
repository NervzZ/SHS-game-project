extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	center()
	
func center():
	var boxSize = get_size()
	var viewportSize = get_viewport_rect().size
	var offsetx = viewportSize.x / 2 - boxSize.x /2
	var offsety = viewportSize.y - 200
	set_position(Vector2(offsetx, offsety))

