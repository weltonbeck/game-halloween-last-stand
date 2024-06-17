class_name WaveManager
extends Node2D

@export var wave_time_in_seconds = 90

@export var mob_spawner:MobSpawner
@export var store:HudStore

var is_active = false
var curent_wave = 0
var wave_time_left = 0

signal wave_end()

func _ready() -> void:
	if (store):
		store.store_close.connect(play)
	await get_tree().create_timer(0.2).timeout
	play()

func _process(_delta: float) -> void:
	if (is_active):
		wave_time_left = $Timer.time_left
	
func play() -> void:
	if (mob_spawner):
		curent_wave += 1
		$Timer.wait_time = wave_time_in_seconds
		is_active = true
		mob_spawner.is_active = true
		$Timer.start()

func stop() -> void:
	is_active = false
	mob_spawner.is_active = false
	wave_end.emit()
	if (store):
		store.open()
	
func _on_timer_timeout() -> void:
	stop()
