class_name DestroyWhenDieComponent
extends Node2D

@export var health_component:HealthComponent
@export var target:Node2D

func _ready() -> void:
	if (health_component):
		health_component.die.connect(_on_die)

func _on_die() -> void:
	if (target):
		target.queue_free()
