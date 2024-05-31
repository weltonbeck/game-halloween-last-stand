class_name CollectibleAuraBoxComponent
extends Area2D

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(area:CollectableBoxComponent) -> void:
	if (area.has_method("activate_aura")):
		area.activate_aura()
