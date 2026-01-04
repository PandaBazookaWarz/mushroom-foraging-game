extends Node

@onready var inventory := InventoryData.new()
@onready var compendium_log := InventoryData.new()
@onready var ui_manager
@onready var paused = false;

func _ready():
	print("GameManager ready")
	
