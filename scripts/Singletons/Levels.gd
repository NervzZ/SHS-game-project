extends Node2D

enum Levels {
	OFFICE_LEVEL,
	BEDROOM_LEVEL
}

var levelPath = {
	Levels.OFFICE_LEVEL: "res://scenes/levels/office.tscn",
	Levels.BEDROOM_LEVEL: "res://scenes/levels/Bedroom.tscn"
}
