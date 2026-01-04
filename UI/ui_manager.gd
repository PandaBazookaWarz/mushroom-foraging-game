extends CanvasLayer
class_name UIManager

var ui_nodes: Array[Node]
var active_ui: ui_screens = ui_screens.None
enum ui_screens {Compendium, Inventory, Terrarium, None}
@export var compendium_ui: Control
@export var inventory_ui: Control
@export var terrarium_ui: Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.ui_manager = self
	ui_nodes = get_tree().get_nodes_in_group("ui_pages")
	pass # Replace with function body.


func switch_ui(to_ui) -> void:
	for node in ui_nodes:
		node.visible = false
		node.close()
	if (active_ui != to_ui):
		var ui_page: UIScreen
		match to_ui:
			ui_screens.Compendium:
				ui_page = compendium_ui
			ui_screens.Inventory:
				ui_page = inventory_ui
			ui_screens.Terrarium:
				ui_page = terrarium_ui
		if ui_page:
			ui_page.open()
			ui_page.visible = true
		active_ui = to_ui
	else:
		active_ui = ui_screens.None
		
	if (active_ui == ui_screens.None):
		visible = false
		GameManager.paused = false
	else:
		visible = true
		GameManager.paused = true
		
