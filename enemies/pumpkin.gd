extends CharacterBody2D

@export var sprite:Sprite2D
@export var input:InputComponent
@export var animation_tree:AnimationTree
@export var movement_component:MovementComponent

func _physics_process(_delta: float) -> void:
	if (input && animation_tree):
		animation_tree.set("parameters/Walk/blend_position", input.input_vector)
		animation_tree["parameters/playback"].travel("Walk")
		flip_sprite()

func flip_sprite() -> void:
	if (sprite):
		if (input.input_vector.x < 0):
			sprite.flip_h = true
		elif (input.input_vector.x > 0):
			sprite.flip_h = false

func _on_health_component_take_damage(_amount: int) -> void:
	if (movement_component):
		movement_component.is_active = false
		await get_tree().create_timer(0.3).timeout
		movement_component.is_active = true
