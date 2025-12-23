extends CharacterBody2D

const SPEED = 300.0
const ACCEL = 7

var input: Vector2

func get_input():
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return input.normalized()

func _process(delta: float) -> void:
	var player_input = get_input()
	
	velocity = lerp(velocity, player_input * SPEED, delta * ACCEL)
	move_and_slide()
