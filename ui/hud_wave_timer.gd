extends CanvasLayer

func _process(_delta: float) -> void:
	if (WaveManager && WaveManager.is_active):
		var progress = (float(WaveManager.wave_time_left) * 100) / float(WaveManager.wave_time_in_seconds)
		$TextureProgressBar.value = progress
