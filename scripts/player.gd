extends Sprite2D

var lookTarget = Vector2(0., 0.)
var movements = Vector2(0., 0.)
@export var moveSpeed = 300

func _input(event):
	if event is InputEventMouseMotion:
		lookTarget = event.global_position

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Hello, I am ", name)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(lookTarget)
	translate(movements * delta * moveSpeed)
	
	#Up-down movements
	if Input.is_action_pressed("Move Up") and !Input.is_action_pressed("Move Down"):
		movements.y = -1
	elif Input.is_action_pressed("Move Down") and !Input.is_action_pressed("Move Up"):
		movements.y = 1
	else:
		movements.y = 0
		
	#Left-right movements
	if Input.is_action_pressed("Move Right") and !Input.is_action_pressed("Move Left"):
		movements.x = 1
	elif Input.is_action_pressed("Move Left") and !Input.is_action_pressed("Move Right"):
		movements.x = -1
	else:
		movements.x = 0
