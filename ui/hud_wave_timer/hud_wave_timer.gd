extends CanvasLayer

@export var wave_manager:WaveManager

func _process(_delta: float) -> void:
	if (wave_manager && wave_manager.is_active):
		var progress = (float(wave_manager.wave_time_left) * 100) / float(wave_manager.wave_time_in_seconds)
		$TextureProgressBar.value = progress
		$TextWaveNumber.text =  str(wave_manager.curent_wave).pad_zeros(2)
