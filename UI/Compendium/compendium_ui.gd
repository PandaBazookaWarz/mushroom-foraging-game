extends UIScreen
class_name CompendiumUI

@onready var slots: Array[CompendiumSlot] = []
@export var grid: Control
@export var icon: TextureRect
@export var title: Label
@export var description: Label


func _ready() -> void:
	print("Compendium Pages Ready!")
	add_to_group("ui_pages")
	for node in grid.get_tree().get_nodes_in_group("compendium_slots"):
		if node is CompendiumSlot:
			slots.append(node)
	update_vis()
	
func update_vis():
	var items = GameManager.inventory.items.duplicate_deep()
	var slots_copy = slots.duplicate_deep()
	for item in items:
		var slot = slots_copy.pop_front()
		slot.item_stack = item
		slot.update_visual()
	for slot in slots_copy:
		slot.item_stack = null
		slot.update_visual()

func set_info(item_data: ItemData):
	print("compendium set_info")
	icon.texture = item_data.icon
	title.text = item_data.name
	description.text = item_data.description
	print(item_data.description)

func open():
	update_vis()
	for stack in GameManager.inventory.items:
		print(stack.item.name, "x", stack.amount)
	
func close():
	pass
