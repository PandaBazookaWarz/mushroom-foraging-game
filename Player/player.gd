extends CharacterBody2D

const SPEED = 300.0
const ACCEL = 7

@export var playerSprite : Sprite2D

var input: Vector2

func get_input():
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return input.normalized()

func _process(delta: float) -> void:
	if !GameManager.paused:
		handle_animation(delta)
		if (Input.is_action_just_pressed("interact")):
			handle_interact()
			
	if (Input.is_action_just_pressed("inventory")):
		GameManager.compendium.inventory_visualization.toggle_inventory()
		
		
		
func handle_animation(delta):
	var player_input = get_input()
	
	velocity = lerp(velocity, player_input * SPEED, delta * ACCEL)
	move_and_slide()
	
	if(velocity.x > 0):
		playerSprite.flip_h = false
	if(velocity.x < 0):
		playerSprite.flip_h = true
		
func handle_interact():
	var other = get_closest_colliding()
	if other:
		# Go up to the parent that actually has interact()
		var target = other
		while target and not target.has_method("interact"):
			target = target.get_parent()
		if target:
			target.interact(self)


func get_closest_colliding() -> Area2D:
	var colliding: Array[Area2D] = $InteractionArea.get_overlapping_areas()
	var closest: Area2D = null
	var closest_dist := INF
	for c in colliding:
		var dist := global_position.distance_squared_to(c.global_position)
		if dist < closest_dist:
			closest_dist = dist
			closest = c
	return closest
