class_name HudPlayerLife
extends CanvasLayer

@export var player:Player

var health_component: HealthComponent

func _ready() -> void:
	if (player):
		health_component = player.get_node("HealthComponent")
		if (health_component):
			health_component.change.connect(draw_progress)
			draw_progress()

func draw_progress() -> void:
	if (health_component):
		var progress = (float(health_component.current_health) * 100) / float(health_component.max_health)
		$TextureProgressBar.value = progress
