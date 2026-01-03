extends Control
class_name CompendiumSlot

@onready var item_stack: ItemStack
@export var icon: TextureRect
@onready var silhouette =  preload("uid://bim22svnyk1r4")


func _ready():
	add_to_group("compendium_slots")

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		print("Texture clicked")
		if(item_stack):
			GameManager.ui_manager.compendium_ui.set_info(item_stack.item)
		
func update_visual():
	if item_stack == null:
		icon.texture = silhouette
		return
	icon.texture = item_stack.item.icon
