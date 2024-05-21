class_name HealthComponent
extends Node2D

signal take_damage()
signal recover_health()
signal die()

@export var max_health:float = 1.0
var current_health: float

func _ready() -> void:
	current_health = max_health

func damage(amount:float) -> void:
	current_health -= amount
	take_damage.emit()
	if (current_health <= 0):
		die.emit()

func recover(amount:float) -> void:
	current_health += amount
	if (current_health > max_health):
		current_health = max_health
	recover_health.emit()
