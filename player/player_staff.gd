extends Node2D

@export var player:CharacterBody2D
@export var attackComponent:AttackShootingComponent

func _ready() -> void:
	if (attackComponent):
		attackComponent.is_attacking.connect(animate_attack)

func animate_attack() -> void:
	$AnimatedSprite2D.play("attack")

func _process(_delta) -> void:
	if (player):
		if (player.global_position.x >= self.global_position.x):
			$AnimatedSprite2D.flip_h = true
			$Shadow.position = $RightMarker2D.position
		else:
			$AnimatedSprite2D.flip_h = false
			$Shadow.position = $LeftMarker2D.position
			
