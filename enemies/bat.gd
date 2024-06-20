extends CharacterBody2D

@export var sprite:AnimatedSprite2D
@export var input:InputComponent
@export var movement_component:MovementComponent

func _physics_process(_delta: float) -> void:
	flip_sprite()

func flip_sprite() -> void:
	if (sprite && input):
		if (input.input_vector.x < 0):
			sprite.flip_h = false
		elif (input.input_vector.x > 0):
			sprite.flip_h = true


func _on_health_component_take_damage(_amount: int) -> void:
	if (movement_component):
		movement_component.is_active = false
		await get_tree().create_timer(0.3).timeout
		movement_component.is_active = true


func _on_health_component_die() -> void:
	if (GameManager):
		GameManager.monster_died += 1
