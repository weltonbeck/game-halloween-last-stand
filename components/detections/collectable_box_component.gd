class_name CollectableBoxComponent
extends Area2D

@export var item_name:String
@export var item_quantity : int = 1

@export var use_magnetic_aura: bool = true
@export var destroy_target:bool = true

@export var target:Node2D

signal was_collected()

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	set_deferred("monitoring", false)
	await get_tree().create_timer(0.5).timeout
	set_deferred("monitoring", true)

func aura_area_entered() -> void:
	if (use_magnetic_aura && target):
		$MovementComponent.target = target
		$MovementComponent.is_active = true

func _on_area_entered(_area:Area2D) -> void:
	if (InventoryManager && item_name):
		$AudioStreamPlayer.play()
		was_collected.emit()
		InventoryManager.add_item(item_name, item_quantity)
		
		if (destroy_target && target):
			await $AudioStreamPlayer.finished
			target.queue_free()
