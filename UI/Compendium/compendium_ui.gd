extends UIScreen
class_name CompendiumUI

@onready var slots: Array[CompendiumSlot] = []
@export var grid: Control
@export var sketch: TextureRect
@export var title: Label
@export var description: Label
@export var pages: TextureRect
@onready var active_filter: ItemData.Biomes = ItemData.Biomes.Common


func _ready() -> void:
	reset_info_page()
	print("Compendium Pages Ready!")
	add_to_group("ui_pages")
	for node in grid.get_tree().get_nodes_in_group("compendium_slots"):
		if node is CompendiumSlot:
			slots.append(node)
	update_vis()
	
func update_vis():
	GameManager.compendium_log.items.sort_custom(func(a, b): return a.item.name < b.item.name)
	var items: Array[ItemStack] = GameManager.compendium_log.items.duplicate_deep()
	
	var slots_copy = slots.duplicate_deep()
	for item in items:
		if item.item.biome != active_filter:
			continue
		var slot = slots_copy.pop_front()
		slot.item_stack = item
		slot.update_visual()
	for slot in slots_copy:
		slot.item_stack = null
		slot.update_visual()

func set_info(item_data: ItemData):
	print("compendium set_info")
	sketch.texture = item_data.sketch
	title.text = item_data.name
	description.text = item_data.description
	print(item_data.description)

func open():
	update_vis()
	for stack in GameManager.inventory.items:
		print(stack.item.name, "x", stack.amount)
	
func close():
	pass

func filter(f: ItemData.Biomes):
	if active_filter == f:
		return
	reset_info_page()
	active_filter = f
	update_vis()
	for sticky in get_tree().get_nodes_in_group("stickies"):
		if sticky.filter != f:
			sticky.z_index = pages.z_index
		else:
			sticky.z_index = pages.z_index+1
			
func reset_info_page():
	title.text = ""
	description.text = ""
	sketch.texture = null
	
	
