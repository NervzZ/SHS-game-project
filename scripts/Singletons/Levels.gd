extends Node2D

enum Levels {
	OFFICE_LEVEL,
	BEDROOM_LEVEL,
	MAIN_MENU
}

var levelPath = {
	Levels.OFFICE_LEVEL: "res://scenes/levels/office.tscn",
	Levels.BEDROOM_LEVEL: "res://scenes/levels/Bedroom.tscn",
	Levels.MAIN_MENU: "res://scenes/menus/main_menu.tscn"
}
