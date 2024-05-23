class_name BlinkWhenGetDamageComponent
extends Node2D

@export var time:float = 0.2
@export var health_component:HealthComponent
@export var target:Node2D

func _ready() -> void:
	if (health_component):
		health_component.take_damage.connect(_on_take_damage)

func _on_take_damage(_amount:float) -> void:
	if (target):
		target.modulate =  Color(10,10,10)
		await get_tree().create_timer(time).timeout
		target.modulate =  Color(1,1,1)
