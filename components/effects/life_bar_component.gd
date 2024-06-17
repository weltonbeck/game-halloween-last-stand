extends Node2D

@export var health_component: HealthComponent

func _ready() -> void:
	hide()
	if (health_component):
		health_component.change.connect(update_progress)

func update_progress() -> void:
	show()
	if (health_component):
		var progress = (float(health_component.current_health) * 100) / float(health_component.max_health)
		$TextureProgressBar.value = progress
