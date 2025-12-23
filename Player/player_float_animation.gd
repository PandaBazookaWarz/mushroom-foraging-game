extends Node2D

@export var FloatHeight = 7.5
@export var ShadowShrink = 1.5
@export var AnimationTime = .5

@export var Player : Sprite2D
@export var Shadow : Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hover()
func hover() -> void:
	var playerTween = create_tween().set_loops().set_trans(Tween.TransitionType.TRANS_QUAD)
	var shadowTween = create_tween().set_loops().set_trans(Tween.TransitionType.TRANS_QUAD)
	
	playerTween.tween_property(Player, "position:y", Player.position.y - FloatHeight, AnimationTime)
	shadowTween.tween_property(Shadow, "scale", Shadow.scale / ShadowShrink, AnimationTime)
	playerTween.tween_property(Player, "position:y", Player.position.y + (FloatHeight / 2), AnimationTime)
	shadowTween.tween_property(Shadow, "scale", Shadow.scale, AnimationTime)
	shadowTween.finished.connect(hover)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
