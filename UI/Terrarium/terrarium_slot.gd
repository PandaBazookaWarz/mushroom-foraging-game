extends Control
class_name TerrariumSlot

@onready var item_stack: ItemStack
@export var icon: TextureRect
@export var count: Label

func _ready():
	add_to_group("terrarium_slots")

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		print("Texture clicked")
		
func update_visual():
	if item_stack == null:
		icon.texture = null
		count.text = ""
		return
	icon.texture = item_stack.item.icon
	count.text = str(item_stack.amount) + " " if item_stack.amount > 0 else ""
