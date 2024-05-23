class_name DamageBoxComponent
extends Area2D

@export var damage:float = 1.0

signal applied_damage()

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(area:HitboxComponent) -> void:
	if (area.has_method("set_damage")):
		area.set_damage(damage)
		applied_damage.emit()
