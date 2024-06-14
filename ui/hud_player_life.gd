extends CanvasLayer

var health_component: HealthComponent

func _ready() -> void:
	if (PlayerManager):
		PlayerManager.has_player.connect(set_health_component)
	
func set_health_component(player:Player) -> void:
	health_component = player.get_node("HealthComponent")
	if (health_component):
		health_component.take_damage.connect(draw_progress)
		health_component.recover_health.connect(draw_progress)
		draw_progress(0)

func draw_progress(_amount: int) -> void:
	if (health_component):
		var progress = (float(health_component.current_health) * 100) / float(health_component.max_health)
		$TextureProgressBar.value = progress
