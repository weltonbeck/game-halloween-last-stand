class_name ShowDamageDigitWhenGetDamageComponent
extends Node2D

var pre_damage_digit = preload("res://components/effects/damage_digit.tscn")
@export var health_component:HealthComponent
@export var target:Node2D

func _ready() -> void:
	if (health_component):
		health_component.take_damage.connect(_on_take_damage)

func _on_take_damage(amount:int) -> void:
	if (target):
		var damage_digit:DamageDigit = pre_damage_digit.instantiate()
		damage_digit.value = amount
		damage_digit.position = position
		get_parent().add_child(damage_digit)
