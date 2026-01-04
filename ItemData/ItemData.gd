# ItemData.gd
extends Resource
class_name ItemData

enum Biomes {Aquatic, Common, Cave, Dark, Floral, Forest, None}
enum Types {Plant, Mushroom, Rock, None}

@export var id: String
@export var name: String
@export var icon: Texture2D
@export var stackable: bool = true
@export var max_stack: int = 99
@export var unlocked: bool = false
@export var description: String
@export var biome: Biomes
@export var type: Types
@export var sketch: Texture2D
