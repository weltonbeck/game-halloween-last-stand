class_name Bullet
extends Node2D

@export var pre_explosion: PackedScene
@export var speed: float = 250.0

var is_able_to_move = false
var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	direction = global_position.direction_to(get_global_mouse_position())
	$AnimatedSprite2D.play("spawn")
	await $AnimatedSprite2D.animation_finished
	is_able_to_move = true
	$AnimatedSprite2D.play("idle")

func _process(delta) -> void:
	if (is_able_to_move):
		translate(direction * speed * delta)

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _on_damage_box_component_applied_damage() -> void:
	explode()

func _on_tree_area_2d_area_entered(_area: Area2D) -> void:
	explode()

func explode() -> void:
	if (pre_explosion) :
		var instance_explosion = pre_explosion.instantiate()
		instance_explosion.global_position = global_position
		get_tree().root.call_deferred("add_child", instance_explosion)
	queue_free()
