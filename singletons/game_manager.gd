extends Node2D

@onready var transition = $UiTransition
var player:Player

func set_player(tmp:Player) -> void:
	player = tmp

func start_game() -> void:
	await change_scene("res://scenes/game_scene.tscn")

func change_scene(new_scene: String) -> void:
	await transition.close()
	get_tree().change_scene_to_file(new_scene)
	await get_tree().process_frame
	await get_tree().create_timer(0.2).timeout
	await transition.open()
