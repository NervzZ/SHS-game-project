extends Area2D

@onready var audioPlayer = get_node("/root/GlobalAudioPlayer")
@onready var sprite: Sprite2D = get_node("Sprite2D")

@export var stream: AudioStream
@export_range(0.01, 4, 0.01) var pitch_scale: float = 1.0
@export_range(-80, 24, 0.02) var volume_db: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.hide()
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if (body.name == "Main Character" and stream != audioPlayer.get_stream()):
		audioPlayer.playAudio(stream, pitch_scale, volume_db)
