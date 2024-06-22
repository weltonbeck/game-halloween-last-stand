class_name AttackShootingComponent
extends Node2D

@export var reload_time: float = 0.5

var can_shoot:bool = true

@export_category("Nodes")
@export var spawner_marker:Marker2D
@export var input:InputComponent
@export var bullet: PackedScene

signal is_attacking()

func _process(_delta) -> void:
	if (bullet && input):
		if (input.attack_input_pressed):
			shoot()

func shoot() -> void:
	if (can_shoot):
		$AudioStreamPlayer.play()
		can_shoot = false
		is_attacking.emit()
		var instance_bullet = bullet.instantiate()
		if (spawner_marker):
			instance_bullet.global_position = spawner_marker.global_position
		else: 
			instance_bullet.global_position = global_position
		get_tree().root.add_child(instance_bullet)
		await get_tree().create_timer(reload_time).timeout
		can_shoot = true
