extends Node2D

@onready var colorRect: ColorRect = get_node("ColorRect")
@onready var container: MarginContainer = get_node("MarginContainer")
@onready var inventoryContainer = get_node("MarginContainer/VBoxContainer/Inventory")

func _ready():
	hide()
	flushInventory()
	
	var viewportSize = get_viewport_rect().size
	colorRect.set_size(Vector2(viewportSize.x * 0.8, viewportSize.y * 0.8))
	container.set_size(Vector2(viewportSize.x * 0.8, viewportSize.y * 0.8))
	GameManager.UI.hide()
	GameManager.pause_game()
	set_position(Vector2(viewportSize.x * 0.1, viewportSize.y * 0.1))

func _input(event):
	if event.is_action_pressed("Open Inventory"):
		if visible:
			close()
		else:
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
	show()
	
func close():
	GameManager.resume_game()
	hide()
	flushInventory()
	
func flushInventory():
	while inventoryContainer.get_child_count() > 0:
		var child = inventoryContainer.get_child(0)
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

