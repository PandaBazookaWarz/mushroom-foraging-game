extends Node
class_name Inventory

@export var capacity: int = 5
var items: Array[ItemStack] = []

# Add an item, stacking if possible
func add(item: ItemData, amount: int = 1) -> bool:
	# Try to stack with existing items
	for stack in items:
		if stack.item == item:
			stack.amount += amount
			return true
	
	# Add new stack if capacity allows
	if items.size() >= capacity:
		return false
	
	var new_stack = ItemStack.new()
	new_stack.item = item
	new_stack.amount = amount
	items.append(new_stack)
	return true

func remove(item: ItemData, amount: int = 1) -> bool:
	for stack in items:
		if stack.item == item:
			stack.amount -= amount
			if stack.amount <= 0:
				items.erase(stack)
			return true
	return false

func print_inventory():
	GameManager.inventory_vis.update_inventory_vis()
	for stack in GameManager.inventory.items:
		print(stack.item.name, "x", stack.amount)
		
