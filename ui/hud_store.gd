class_name HudStore
extends CanvasLayer

func _ready() -> void:
	hide()
	if (GameManager):
		GameManager.store = self

func open() -> void:
	get_tree().paused = true
	show()
	

func close() -> void:
	hide()
	get_tree().paused = false

func power_up() -> void:
	#if (InventoryManager):
		#InventoryManager.add_item("Coin", 50)
	close()
	if (GameManager):
		GameManager.on_store_end()
	
