extends CanvasLayer

var item_name = "Coin"

func _ready() -> void:
	if (InventoryManager):
		InventoryManager.inventory_change.connect(write_coins)

func write_coins() -> void:
	var value = InventoryManager.get_item_quantity(item_name)
	%RichTextLabel.text = str(value).pad_zeros(5)
