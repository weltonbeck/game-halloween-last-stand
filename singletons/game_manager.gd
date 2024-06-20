extends Node2D

@onready var transition = $UiTransition
var player:Player
var wave = 0
var monster_died = 0

func set_player(tmp:Player) -> void:
	player = tmp

func start_game() -> void:
	wave = 0
	monster_died = 0
	InventoryManager.clear_all()
	PowerupManager.clear_all()
	await change_scene("res://scenes/game_scene.tscn")

func change_scene(new_scene: String) -> void:
	await transition.close()
	get_tree().change_scene_to_file(new_scene)
	await get_tree().process_frame
	await get_tree().create_timer(0.2).timeout
	await transition.open()
