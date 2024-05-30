class_name InputComponent
extends Node2D

var input_vector:Vector2 = Vector2.ZERO
var attack_input:bool = false
var attack_input_pressed:bool = false

func _physics_process(delta: float) -> void:
	handleMoveInputs(delta)
	
func handleMoveInputs(_delta: float) -> void: 
	pass
