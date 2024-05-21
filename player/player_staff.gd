extends Node2D

@export var player:CharacterBody2D

func _process(_delta) -> void:
	if (player):
		if (player.global_position.x >= self.global_position.x):
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
