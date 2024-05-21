class_name MovementComponent
extends Node2D

@export var speed: float = 100.0
@export var lerpForce: float = 0.5

@export_category("Nodes")
@export var target:CharacterBody2D
@export var input:InputComponent

func _physics_process(_delta: float) -> void:
	if (target && input):
		var new_velocity = input.input_vector * speed
		target.velocity = lerp(target.velocity, new_velocity, lerpForce)
		target.move_and_slide()
