class_name Player
extends CharacterBody2D

func _ready():
	if (PlayerManager):
		PlayerManager.player = self
