extends Node2D

@onready var colorRect: ColorRect = get_node("ColorRect")
@onready var container: MarginContainer = get_node("MarginContainer")
@onready var inventoryContainer = get_node("MarginContainer/VBoxContainer/Inventory")
@onready var objectiveContainer = get_node("MarginContainer/VBoxContainer/Objectives")
@onready var sfx_inventory = get_node("sfx_Inventory")

var currentObjective: HBoxContainer
var labelSettingsCurrent: LabelSettings
var labelSettingsDone: LabelSettings

func _ready():
	hide()
	labelSettingsCurrent = LabelSettings.new()
	labelSettingsDone = LabelSettings.new()
	labelSettingsCurrent.set_font_size(35)
	labelSettingsDone.set_font_size(35)
	labelSettingsDone.set_font_color(Color(0.45, 0.45, 0.45, 1))
	
	var viewportSize = get_viewport_rect().size
	colorRect.set_size(Vector2(viewportSize.x * 0.8, viewportSize.y * 0.8))
	container.set_size(Vector2(viewportSize.x * 0.8, viewportSize.y * 0.8))
	set_position(Vector2(viewportSize.x * 0.1, viewportSize.y * 0.1))
	
	flushObjectives()
	currentObjective = addObjective("Go to work", Globals.objectives["Go to work"])
	
	flushInventory()
	

func _input(event):
	if event.is_action_pressed("Open Inventory"):
		if visible:
			close()
			GameManager.currentObjectiveUi.show()
		else:
			GameManager.currentObjectiveUi.hide()
			open()

func open():
	if GameManager.playerInventory.is_empty():
		var emptyInventoryMessage = Label.new()
		emptyInventoryMessage.set_text("My inventory is empty")
		var labelSettings : LabelSettings = LabelSettings.new()
		labelSettings.set_font_size(35)
		emptyInventoryMessage.set_label_settings(labelSettings)
		inventoryContainer.add_child(emptyInventoryMessage) 
	else: 
		for itemName in GameManager.playerInventory:
			addItem(itemName, Globals.gameItems[itemName])
		
	GameManager.pause_game()
	sfx_inventory.play();
	show()
	
func close():
	GameManager.resume_game()
	sfx_inventory.stop()
	hide()
	flushInventory()
	
func flushInventory():
	while inventoryContainer.get_child_count() > 0:
		var child = inventoryContainer.get_child(0)
		child.free()
		
func flushObjectives():
	while objectiveContainer.get_child_count() > 0:
		var child = objectiveContainer.get_child(0)
		child.free()

func addItem(name, item):
	if Globals.gameItems.has(name):
		var box: HBoxContainer = HBoxContainer.new()
		var tex: TextureRect = TextureRect.new()
		var nameLabel: Label = Label.new()
		var labelSettings : LabelSettings = LabelSettings.new()
		
		box.add_theme_constant_override("separation", 25)
		tex.set_expand_mode(TextureRect.EXPAND_FIT_WIDTH_PROPORTIONAL)
		labelSettings.set_font_size(35)
		nameLabel.set_label_settings(labelSettings)
		nameLabel.set_vertical_alignment(VERTICAL_ALIGNMENT_TOP)
		nameLabel.set_v_size_flags(Control.SIZE_SHRINK_BEGIN)
		var descriptionLabel = nameLabel.duplicate()
		descriptionLabel.set_h_size_flags(Control.SIZE_EXPAND_FILL)
		descriptionLabel.set_autowrap_mode(TextServer.AUTOWRAP_WORD)
		
		box.add_child(tex)
		box.add_child(nameLabel)
		box.add_child(descriptionLabel)
		
		tex.set_texture(item.image)
		nameLabel.set_text(name + " : ")
		descriptionLabel.set_text(item.description)
		inventoryContainer.add_child(box)

func nextObjective():
	#grey out the old objective
	var currName = currentObjective.get_child(0)
	currName.set_label_settings(labelSettingsDone)
	currentObjective.get_child(1).set_label_settings(labelSettingsDone)
	
	var nextObjective = Globals.objectives[currName.get_text()].nextObjective
	GameManager.currentObjectiveUi.setObjective(nextObjective)
	if (nextObjective != null):
		currentObjective = addObjective(nextObjective, Globals.objectives[nextObjective])
		GameManager.current_objective = currentObjective.get_child(0).text

func addObjective(name, objective) -> HBoxContainer:
	var nameLabel = Label.new()
	var box: HBoxContainer = HBoxContainer.new()
	box.add_theme_constant_override("separation", 25)
	nameLabel.set_label_settings(labelSettingsCurrent)
	nameLabel.set_vertical_alignment(VERTICAL_ALIGNMENT_TOP)
	nameLabel.set_v_size_flags(Control.SIZE_SHRINK_BEGIN)
	
	var descriptionLabel = nameLabel.duplicate()
	descriptionLabel.set_h_size_flags(Control.SIZE_EXPAND_FILL)
	descriptionLabel.set_autowrap_mode(TextServer.AUTOWRAP_WORD)
	
	box.add_child(nameLabel)
	box.add_child(descriptionLabel)
	
	nameLabel.set_text(name)
	descriptionLabel.set_text("- " + objective.description)
	
	objectiveContainer.add_child(box)
	
	return box
