class_name DamageDigit
extends Node2D

@export var value: float = 0

func _ready() -> void:
	$Label.text = str(value)
