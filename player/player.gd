class_name Player
extends CharacterBody2D

@export var sprite:Sprite2D
@export var input:InputComponent
@export var animation_tree:AnimationTree

var state_machine

func _ready() -> void:
	if (GameManager):
		GameManager.set_player(self)
	
	if (animation_tree):
		state_machine = animation_tree["parameters/playback"]
	
	if (PowerupManager) :
		PowerupManager.change.connect(powerup)
		powerup(PowerupManager.types.life)
		powerup(PowerupManager.types.speed)

func powerup(type: PowerupManager.types) -> void:
	if (PowerupManager) :
		if (type == PowerupManager.types.life):
			var life_level = PowerupManager.get_value(PowerupManager.types.life)
			$HealthComponent.max_health = 65 + (10 * life_level)
			$HealthComponent.recover($HealthComponent.max_health)
		if (type == PowerupManager.types.speed):
			var speed_level = PowerupManager.get_value(PowerupManager.types.speed)
			$MovementComponent.speed = 50 + (10 * speed_level)
			$AttackShootingComponent.reload_time = 1.5 - (0.1 * speed_level)

func _physics_process(_delta: float) -> void:
	if (input && animation_tree && state_machine):
		if (input.input_vector != Vector2.ZERO):
			animation_tree.set("parameters/Idle/blend_position", input.input_vector)
			animation_tree.set("parameters/Walk/blend_position", input.input_vector)
			state_machine.travel("Walk")
		else:
			state_machine.travel("Idle")
		
		flip_sprite()

func flip_sprite() -> void:
	if (sprite):
		if (input.input_vector.x < 0):
			sprite.flip_h = true
		elif (input.input_vector.x > 0):
			sprite.flip_h = false
