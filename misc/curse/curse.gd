extends Node2D

func _ready() -> void:
	$ShowTimer.start()
	if (PowerupManager) :
		PowerupManager.change.connect(powerup)
		powerup(PowerupManager.types.curse)

func powerup(type: PowerupManager.types) -> void:
	if (PowerupManager) :
		if (type == PowerupManager.types.curse):
			var curse_level = PowerupManager.get_value(PowerupManager.types.curse)
			$HiddenTimer.wait_time = 5 + curse_level
			$DamageBoxComponent.damage = 3 + curse_level

func show_curse() -> void:
	$DamageBoxComponent.active_damage = true
	$AnimationPlayer.play("show")
	$HiddenTimer.start()

func hide_curse() -> void:
	$DamageBoxComponent.active_damage = false
	$AnimationPlayer.play("hide")
	$ShowTimer.start()
