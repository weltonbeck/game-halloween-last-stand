@tool
class_name HitboxComponent
extends Area2D

@export var health_component:HealthComponent

func set_damage(amount:int) -> void:
	if (health_component):
		health_component.damage(amount)

func _get_configuration_warnings() -> PackedStringArray:
	var alerts = PackedStringArray([])
	if (!health_component):
		alerts.append('This node need a HealthComponent')
	return alerts

