class_name DestroyWhenDieComponent
extends Node2D

@export var await_time:float = 0.2

@export_category("Nodes")
@export var health_component:HealthComponent
@export var target:Node2D

func _ready() -> void:
	if (health_component):
		health_component.die.connect(_on_die)

func _on_die() -> void:
	if (target):
		await get_tree().create_timer(await_time).timeout
		target.queue_free()
