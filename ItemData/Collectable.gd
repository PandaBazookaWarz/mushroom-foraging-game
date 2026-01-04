@tool
extends Node2D
class_name Collectable

@export var itemData: ItemData
@export var sprite: Sprite2D

func _ready() -> void:
	sprite = $Sprite2D
	sprite.texture = itemData.icon
	$Area2D/CollisionShape2D.shape.radius = \
	max(sprite.texture.get_size().x, \
	sprite.texture.get_size().y)/2

func interact(interactor):
	print("pick up "+ itemData.name)
	GameManager.inventory.add(itemData)
	GameManager.compendium_log.add(itemData)
