extends Node

@onready var inventory := InventoryData.new()
@onready var compendium_ui
@onready var inventory_ui
@onready var ui_manager
@onready var paused = false;

func _ready():
	print("GameManager ready")
	
