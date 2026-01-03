extends Node

@onready var inventory := Inventory.new()
@onready var compendium
@onready var paused = false;

func _ready():
	print("GameManager ready")
	
