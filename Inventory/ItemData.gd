# ItemData.gd
extends Resource
class_name ItemData

@export var id: String
@export var name: String
@export var icon: Texture2D
@export var stackable: bool = true
@export var max_stack: int = 99
@export var description: String
