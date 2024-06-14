extends Node

var default_value = 30
var price_factor = 1.5

enum types { life,power,speed,curse }

var powerups:Dictionary = {
	types.life: 0,
	types.power: 0,
	types.speed: 0,
	types.curse: 0
}

func get_value(type: types) -> int:
	return powerups[type]

func increase(type: types) -> void:
	powerups[type] += 1

func get_price(type: types) -> int:
	return round(default_value * (powerups[type] * price_factor)) + default_value
