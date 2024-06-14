class_name CollectorMagneticAuraBoxComponent
extends Area2D

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(area:CollectableBoxComponent) -> void:
	if (area.has_method("aura_area_entered")):
		area.aura_area_entered()
