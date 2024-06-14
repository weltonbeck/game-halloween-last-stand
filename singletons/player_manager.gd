extends Node2D

var player:Player

signal has_player(player:Player)

func set_player(tmp:Player) -> void:
	player = tmp
	has_player.emit(player)
