extends CanvasLayer
class_name Compendium

@export var visualization: CompendiumPages

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.compendium = self
