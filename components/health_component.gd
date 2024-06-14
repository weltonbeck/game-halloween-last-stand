class_name HealthComponent
extends Node2D

signal change()
signal take_damage(amount:int)
signal recover_health(amount:int)
signal die()

@export var max_health:int = 1

var current_health: int

func _ready() -> void:
	current_health = max_health
	change.emit()

func damage(amount:int) -> void:
	current_health -= amount
	take_damage.emit(amount)
	change.emit()
	if (current_health <= 0):
		die.emit()

func recover(amount:int) -> void:
	current_health += amount
	if (current_health > max_health):
		current_health = max_health
	change.emit()
	recover_health.emit(amount)
