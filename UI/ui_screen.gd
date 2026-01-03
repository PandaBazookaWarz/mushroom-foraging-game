extends Control
class_name UIScreen

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func close():
	push_error("Please provide an implementation in the child class!")
	
func open():
	push_error("Please provide an implementation in the child class!")
