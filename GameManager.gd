extends Node

@onready var inventory := Inventory.new()
@onready var inventory_vis

func _ready():
	print("GameManager ready!")
