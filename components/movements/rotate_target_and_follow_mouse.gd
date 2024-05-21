class_name RotateTargetAndFollowMouseComponent
extends Node2D

@export var radius: float = 15.0

@export_category("Nodes")
@export var target:Node2D
@export var rotate_center_target:Node2D

var direction = Vector2.ZERO

func _process(_delta) -> void:
	if (target && rotate_center_target):
		direction = rotate_center_target.global_position.direction_to(get_global_mouse_position()).normalized()
		target.global_position = rotate_center_target.global_position + direction * radius
