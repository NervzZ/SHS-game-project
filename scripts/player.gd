extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Hello, I am ", name)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate(delta)
