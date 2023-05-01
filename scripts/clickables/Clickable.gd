extends Node2D

@export var clickableArea : Area2D
@export var interactArea : Area2D
@export var mainSprite : Sprite2D 

var mouseIsHovering : bool = false
var playerIsInRange : bool = false
var highlightShader = ShaderMaterial.new()

func _input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.is_action("Left Click"):
		if mouseIsHovering and playerIsInRange:
			clickedEvent()

# Called when the node enters the scene tree for the first time.
func _ready():
	if (clickableArea == null):
		push_error("ERROR : %s needs a clickableArea. Please set it from the inspector." % name)
		
	if (interactArea == null):
		push_error("ERROR : %s needs a interactArea. Please set it from the inspector." % name)
		
	if (mainSprite == null):
		push_error("ERROR : %s needs a mainSprite. Please set it from the inspector." % name)
	
	highlightShader.set_shader(load("res://shaders/highlight.gdshader"))
	init()
	clickableArea.mouse_entered.connect(_on_mouse_enter)
	clickableArea.mouse_exited.connect(_on_mouse_exit)
	interactArea.body_entered.connect(_on_body_entered)
	interactArea.body_exited.connect(_on_body_exited)


#override this to have additional initialisation logic on _ready()
func init():
	pass
	
func _process(delta):
	if mouseIsHovering and playerIsInRange:
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	else:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)

#override this to define your behavior when the clickable is clicked
func clickedEvent():
	print("I have been clicked")

func _on_mouse_enter():
	mouseIsHovering = true
	mainSprite.set_material(highlightShader)

func _on_mouse_exit():
	mouseIsHovering = false
	mainSprite.set_material(null)
	
func _on_body_entered(body):
	if (body.name == "Main Character"):
		playerIsInRange = true
		
func _on_body_exited(body):
	if (body.name == "Main Character"):
		playerIsInRange = false
