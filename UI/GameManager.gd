extends Node

@onready var inventory := Inventory.new()
var inventory_vis #reference to visuals
@onready var compendium
@onready var paused = false;

func _ready():
	print("GameManager ready")
	
