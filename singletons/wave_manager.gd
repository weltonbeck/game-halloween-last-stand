extends Node2D

var mob_spawner:MobSpawner

var is_active = false
var wave = 0
var wave_time_in_seconds = 5
var wave_time_left = 0

signal wave_end()

func set_mob_spawner(tmp:MobSpawner) -> void:
	mob_spawner = tmp
	
func _process(_delta: float) -> void:
	if (is_active):
		wave_time_left = $Timer.time_left
		if (mob_spawner && !mob_spawner.is_active):
			mob_spawner.is_active = true
	elif(!is_active):
		if (mob_spawner && mob_spawner.is_active):
			mob_spawner.is_active = false
	
func play() -> void:
	wave += 1
	$Timer.wait_time = wave_time_in_seconds
	is_active = true
	$Timer.start()

func stop() -> void:
	is_active = false
	wave_end.emit()

func _on_timer_timeout() -> void:
	stop()
