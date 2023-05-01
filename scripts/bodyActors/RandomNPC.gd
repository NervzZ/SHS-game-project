extends "res://scripts/bodyActors/BodyActor.gd"

var timer : float = 0
var timer_limit : int = 0
var currDirection : Vector2 = Vector2.ZERO
@onready var animatedSprite : AnimatedSprite2D = get_node("AnimatedSprite2D")

func _ready():
	newRandomMovement()
	
func _process(delta):
	if timer > timer_limit:
		newRandomMovement()
		timer = 0
	velocity = (currDirection * movement_speed)
	move_and_slide()
	look_at(computeLookTarget())
	
	if velocity != Vector2.ZERO:
		animatedSprite.play()
	else:
		animatedSprite.stop()
	
	timer += delta

func newRandomMovement():
	timer_limit = randi_range(1, 3)
	currDirection.x = randi_range(-1, 1)
	currDirection.y = randi_range(-1, 1)

func computeLookTarget() -> Vector2 :
	return global_position + velocity.normalized()
