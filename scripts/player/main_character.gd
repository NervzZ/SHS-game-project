extends CharacterBody2D


@export var walkVelocity = 500


var mouseTarget = Vector2.ZERO
@onready var footsteps: AudioStreamPlayer2D = get_node("Footsteps")
@onready var animatedSprite = get_node("AnimatedSprite2D")



	
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
		mouseTarget = get_global_mouse_position()
		look_at(computeLookTarget())
		
		if !footsteps.playing:
			footsteps.play()
	else:
		animatedSprite.stop()
		footsteps.stop()
	
	#makes it smoother when being stopped by a collision to prevent the player model to go brrrrrr
	if !Input.is_action_pressed("Move Right") and !Input.is_action_pressed("Move Left") and !Input.is_action_pressed("Move Up") and !Input.is_action_pressed("Move Down"):
		look_at(mouseTarget)
	
	#utile si on veut décélerer mais je trouve plus agréable que le stop soit abrupte
	#velocity = velocity.move_toward(Vector2.ZERO, friction)

func computeLookTarget() -> Vector2 :
	return global_position + velocity.normalized()
	
