extends CharacterBody2D


@export var walkVelocity = 500
#@export var friction = 100

var mouseTarget = Vector2.ZERO

@onready var animatedSprite = get_node("AnimatedSprite2D")

#var SCREEN_WIDTH = get_viewport_rect().size.x
#var SCREEN_HEIGHT = get_viewport_rect().size.y

# plus tard on se décidera sur la camera
#var camera_holder
#var camera


func _ready():
	#camera_holder = Node2D.new()
	#add_child(camera_holder)
	#camera = get_node("Camera2D")
	#camera_holder.position = position
	pass
	
func _get_position():
	return position
	
func _input(event):
	if event is InputEventMouseMotion:
		mouseTarget = get_global_mouse_position()
		
		
func _process(_delta):
	
	computeLookTarget()
	
	#Up-down movements
	if Input.is_action_pressed("Move Up") and !Input.is_action_pressed("Move Down"):
		velocity.y = -walkVelocity
	elif Input.is_action_pressed("Move Down") and !Input.is_action_pressed("Move Up"):
		velocity.y = walkVelocity
	else:
		velocity.y = 0
		
	#Left-right movements
	if Input.is_action_pressed("Move Right") and !Input.is_action_pressed("Move Left"):
		velocity.x = walkVelocity
	elif Input.is_action_pressed("Move Left") and !Input.is_action_pressed("Move Right"):
		velocity.x = -walkVelocity
	else:
		velocity.x = 0
		
	move_and_slide()
	
	if velocity != Vector2.ZERO:
		animatedSprite.play("Walking")
		look_at(computeLookTarget())
	else:
		animatedSprite.stop()
	
	#makes it smoother when being stopped by a collision to prevent the player model to go brrrrrr
	if !Input.is_action_pressed("Move Right") and !Input.is_action_pressed("Move Left") and !Input.is_action_pressed("Move Up") and !Input.is_action_pressed("Move Down"):
		look_at(mouseTarget)
	
	#utile si on veut décélerer mais je trouve plus agréable que le stop soit abrupte
	#velocity = velocity.move_toward(Vector2.ZERO, friction)

func computeLookTarget() -> Vector2 :
	return global_position + velocity.normalized()
	
