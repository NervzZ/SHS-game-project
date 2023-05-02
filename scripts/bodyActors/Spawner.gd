extends Node2D

@onready var gm = get_node("/root/GameManager")

@export var actor_to_spawn : PackedScene
@export var spawn_hours : int = 0
@export var spawn_minutes : int = 0

func _init():
	hide()

func _process(delta):
	if spawn_hours == gm.clock.hours and spawn_minutes == gm.clock.minutes:
		spawn()
		
func spawn():
	var actor = actor_to_spawn.instantiate()
	get_parent().add_child(actor)
	actor.position = position
	queue_free()
