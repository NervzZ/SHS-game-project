extends CharacterBody2D


const accelecration = 500
const friction = 100

var lookTarget = deg_to_rad(0); 

@onready var sprite = get_node("Sprite2D/AnimatedSprite2D")

var SCREEN_WIDTH = get_viewport_rect().size.x
var SCREEN_HEIGHT = get_viewport_rect().size.y

var camera_holder
var camera


func _ready():
	camera_holder = Node2D.new()
	add_child(camera_holder)
	camera = get_node("Camera2D")
	camera_holder.position = position
	

func _input(event):
	if event is InputEventKey:
		
		if Input.is_action_pressed("move_left"):
			lookTarget = deg_to_rad(180)
			
		elif Input.is_action_pressed("move_right"):
			lookTarget = deg_to_rad(0)
			
		if Input.is_action_pressed("move_up"):
			lookTarget = deg_to_rad(270)
			
		elif Input.is_action_pressed("move_down"):
			lookTarget = deg_to_rad(90)
		
		
		
func _physics_process(delta):
	
	set_rotation(lookTarget)
	if velocity != Vector2.ZERO:
		sprite.play("Walking")
	else:
		sprite.stop()
		
	if Input.is_action_pressed("move_left"):
		velocity.x = - accelecration

	elif Input.is_action_pressed("move_right"):
		velocity.x = accelecration
		
	if Input.is_action_pressed("move_up"):
		velocity.y = - accelecration
		sprite.play("Walking")
	elif Input.is_action_pressed("move_down"):
		velocity.y = accelecration
		sprite.play("Walking")
	move_and_slide()
	
	velocity = velocity.move_toward(Vector2.ZERO, friction)


		
	
