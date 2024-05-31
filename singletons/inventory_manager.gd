extends Node2D

var inventory:Dictionary = {}

signal inventory_change()

func check_if_exist(item_name: String) -> bool:
	return item_name in inventory.keys()

func get_item_quantity(item_name: String) -> int:
	if (check_if_exist(item_name)):
		return inventory[item_name]
	else:
		return 0

func add_item(item_name: String, quantity: int) -> void:
	if (check_if_exist(item_name)):
		inventory[item_name] = inventory[item_name] + quantity
	else:
		inventory[item_name] = quantity
	inventory_change.emit()

func remove_item(item_name: String, quantity: int) -> void:
	if (check_if_exist(item_name)):
		var new_amount = inventory[item_name] - quantity
		if (new_amount > 0) :
			inventory[item_name] = new_amount
		else :
			inventory[item_name] = 0
		inventory_change.emit()
