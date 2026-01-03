extends UIScreen
class_name InventoryUI

@onready var slots: Array[InventorySlot] = []
@export var grid: Control

func _ready() -> void:
	print("Inventory Pages Ready!")
	add_to_group("ui_pages")
	for node in get_tree().get_nodes_in_group("inventory_slots"):
		if node is InventorySlot:
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

func open():
	update_vis()
	for stack in GameManager.inventory.items:
		print(stack.item.name, "x", stack.amount)
	
func close():
	pass
