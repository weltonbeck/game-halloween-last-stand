class_name AttackShootingComponent
extends Node2D

@export var can_shoot:bool = true
@export var reload_time_in_seconds: float = 15.0

@export_category("Nodes")
@export var marker:Marker2D
@export var input:InputComponent
@export var bullet: PackedScene

func _process(_delta) -> void:
	if (bullet && input && can_shoot):
		if (input.attack_input):
			var instance_bullet = bullet.instantiate()
			if (marker):
				instance_bullet.global_position = marker.global_position
			else: 
				instance_bullet.global_position = global_position
			get_tree().root.add_child(instance_bullet)
