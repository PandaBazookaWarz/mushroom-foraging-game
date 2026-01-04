extends UIScreen
class_name TerrariumUI

@onready var slots: Array[TerrariumSlot] = []
@export var grid: Control

func _ready() -> void:
	add_to_group("ui_pages")
	for node in get_tree().get_nodes_in_group("terrarium_slots"):
		if node is TerrariumSlot:
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
