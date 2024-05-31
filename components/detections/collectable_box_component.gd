class_name CollectableBoxComponent
extends Area2D

@export var item_name:String
@export var item_quantity : int = 1

@export_subgroup("Destroy after collected")
@export var destroy_target:bool = true
@export var target:Node2D
@export_subgroup("Aura collected")
@export var activate_aura_collected:bool = true
@export var movementComponent:MovementComponent

signal was_collected()

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func activate_aura() -> void:
	if (activate_aura_collected && movementComponent):
		movementComponent.is_active = true

func _on_area_entered(_area:Area2D) -> void:
	if (InventoryManager && item_name):
		was_collected.emit()
		InventoryManager.add_item(item_name, item_quantity)
		
		if (destroy_target && target):
			target.queue_free()
