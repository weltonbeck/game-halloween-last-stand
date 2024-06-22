@tool
class_name HitBoxComponent
extends Area2D

@export var health_component:HealthComponent
@export var imortality_after_damage: float = 0

func set_damage(amount:int) -> void:
	$AudioStreamPlayer.play()
	if (health_component):
		health_component.damage(amount)
		
		if(imortality_after_damage > 0):
			set_deferred("monitorable", false)
			await get_tree().create_timer(imortality_after_damage).timeout
			set_deferred("monitorable", true)
		

func _get_configuration_warnings() -> PackedStringArray:
	var alerts = PackedStringArray([])
	if (!health_component):
		alerts.append('This node need a HealthComponent')
	return alerts

