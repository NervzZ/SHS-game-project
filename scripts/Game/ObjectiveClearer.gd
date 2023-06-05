extends Area2D

@export var objective_to_clear: String = "objective name"

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if (body.name == "Main Character"):
		if (GameManager.current_objective == objective_to_clear):
			GameManager.gotoNextObjective()
