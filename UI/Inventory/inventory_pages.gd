extends Control

func _ready() -> void:
	GameManager.inventory_vis = self
	update_inventory_vis()
	
func update_inventory_vis():
	var items = GameManager.inventory.items.duplicate_deep()
	var slots =  $HBoxContainer/RightPage/CenterContainer/InventoryGrid\
	.get_node("MarginContainer/GridContainer").get_children()
	for item in items:
		var slot = slots.pop_front()
		var icon: TextureRect = slot.get_node("MarginContainer/Icon")
		var count: Label = slot.get_node("Count")
		var current_item_stack: ItemStack = items.pop_front()
		icon.texture = current_item_stack.item.icon
		count.text = str(current_item_stack.amount) + " " if current_item_stack.amount > 0 else ""
	for slot in slots:
		var icon: TextureRect = slot.get_node("MarginContainer/Icon")
		icon.texture = null
		var count: Label = slot.get_node("Count")
		count.text = ""
