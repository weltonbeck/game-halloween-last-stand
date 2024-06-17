extends Node

var default_price = 30
var price_factor = 3
var max_level = 10

enum types { life,power,speed,curse }

signal change(type: types)

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
	change.emit(type)

func get_price(type: types) -> int:
	if (powerups[type] >= 1):
		return round(default_price * (powerups[type] * price_factor))
	else:
		return default_price
