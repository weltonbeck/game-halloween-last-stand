class_name TransparencyWhenOnTopComponent
extends Area2D

@export var target: Node2D
@export_range(0, 1) var opacity: float = 0.5

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(_body:Node2D) -> void:
	if (target):
		target.modulate.a = opacity

func _on_body_exited(_body:Node2D) -> void:
	if (target):
		target.modulate.a = 1.0
