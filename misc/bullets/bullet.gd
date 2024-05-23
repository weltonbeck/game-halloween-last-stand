class_name Bullet
extends Node2D

@export var speed: float = 200.0

var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	direction = global_position.direction_to(get_global_mouse_position())

func _process(delta) -> void:
	translate(direction * speed * delta)

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _on_damage_box_component_applied_damage() -> void:
	queue_free()
