extends Control
class_name CompendiumPages

@onready var slots: Array[CompendiumSlot] = []
@export var inventory_grid: Control

func _ready() -> void:
	print("Compendium Pages Ready!")
	for node in get_tree().get_nodes_in_group("compendium_slots"):
		if node is CompendiumSlot:
			slots.append(node)
	update_inventory_vis()
	
func update_inventory_vis():
	var items = GameManager.inventory.items.duplicate_deep()
	var slots_copy = slots.duplicate_deep()
	for item in items:
		var slot = slots_copy.pop_front()
		slot.item_stack = item
		slot.update_visual()
	for slot in slots_copy:
		slot.item_stack = null
		slot.update_visual()

func toggle():
	update_inventory_vis()
	GameManager.compendium.visible = !GameManager.compendium.visible
	GameManager.paused = GameManager.compendium.visible #if inventory visible is true, paused is true
	for stack in GameManager.inventory.items:
		print(stack.item.name, "x", stack.amount)
