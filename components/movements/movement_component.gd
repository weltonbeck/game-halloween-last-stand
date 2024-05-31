class_name MovementComponent
extends Node2D

@export var is_active: bool = true

@export var speed: float = 100.0
@export var lerp_force: float = 0.5

@export_category("Nodes")
@export var target:Node2D
@export var input:InputComponent

func _physics_process(delta: float) -> void:
	if (target && input && is_active):
		var new_velocity = input.input_vector * speed
		if (target.is_class("CharacterBody2D")):
			target.velocity = lerp(target.velocity, new_velocity, lerp_force)
			target.move_and_slide()
		else:
			target.translate(new_velocity * delta)
