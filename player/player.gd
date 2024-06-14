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
