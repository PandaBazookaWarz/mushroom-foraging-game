@tool
extends TextureRect
@export var filter: ItemData.Biomes
@export var label: Label
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = ItemData.Biomes.find_key(filter)
	add_to_group("stickies")
	pass # Replace with function body.


func _gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		print("Texture clicked")
		GameManager.ui_manager.compendium_ui.filter(filter)
		
