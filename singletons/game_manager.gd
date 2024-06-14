extends Node2D

var store:HudStore

func _ready() -> void:
	WaveManager.wave_end.connect(on_wave_end)
	WaveManager.play()

func on_wave_end() -> void:
	store.open()

func on_store_end() -> void:
	store.hide()
	WaveManager.play()
