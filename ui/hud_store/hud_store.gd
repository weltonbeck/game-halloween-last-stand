class_name HudStore
extends CanvasLayer

signal store_close()

func _ready() -> void:
	hide()

func open() -> void:
	get_tree().paused = true
	if (GameManager):
		await GameManager.transition.close()
	update_prices()
	show()
	if (GameManager):
		await GameManager.transition.open()

func close() -> void:
	if (GameManager):
		await GameManager.transition.close()
	hide()
	if (GameManager):
		await GameManager.transition.open()
	get_tree().paused = false
	store_close.emit()
	
func update_prices() -> void:
	if (PowerupManager):
		var life_price = PowerupManager.get_price(PowerupManager.types.life)
		if (PowerupManager.get_value(PowerupManager.types.life) >= PowerupManager.max_level):
			$TextureButtonLife.hide()
		else:
			$TextureButtonLife/RichTextLabelPrice.text = "[center]" + str(life_price) + "[/center]"
		var power_price = PowerupManager.get_price(PowerupManager.types.power)
		if (PowerupManager.get_value(PowerupManager.types.power) >= PowerupManager.max_level):
			$TextureButtonPower.hide()
		else:
			$TextureButtonPower/RichTextLabelPrice.text = "[center]" + str(power_price) + "[/center]"
		var speed_price = PowerupManager.get_price(PowerupManager.types.speed)
		if (PowerupManager.get_value(PowerupManager.types.speed) >= PowerupManager.max_level):
			$TextureButtonSpeed.hide()
		else:
			$TextureButtonSpeed/RichTextLabelPrice.text = "[center]" + str(speed_price) + "[/center]"
		var curse_price = PowerupManager.get_price(PowerupManager.types.curse)
		if (PowerupManager.get_value(PowerupManager.types.curse) >= PowerupManager.max_level):
			$TextureButtonCurse.hide()
		else:
			$TextureButtonCurse/RichTextLabelPrice.text = "[center]" + str(curse_price) + "[/center]"
	
func power_up(type: PowerupManager.types) -> void:
	if (PowerupManager && InventoryManager):
		var coins = InventoryManager.get_item_quantity("Coin")
		var price = PowerupManager.get_price(type)
		if (coins >= price):
			InventoryManager.remove_item("Coin", price)
			PowerupManager.increase(type)
			update_prices()
	
func _on_texture_button_next_pressed() -> void:
	close()

func _on_texture_button_life_pressed() -> void:
	power_up(PowerupManager.types.life)

func _on_texture_button_power_pressed() -> void:
	power_up(PowerupManager.types.power)

func _on_texture_button_speed_pressed() -> void:
	power_up(PowerupManager.types.speed)

func _on_texture_button_curse_pressed() -> void:
	power_up(PowerupManager.types.curse)
