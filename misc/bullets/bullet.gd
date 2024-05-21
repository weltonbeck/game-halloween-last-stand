class_name Bullet
extends Node2D

@export var speed: float = 200.0

var direction: Vector2 = Vector2.ZERO

func _ready():
	direction = global_position.direction_to(get_global_mouse_position())

func _process(delta):
	translate(direction * speed * delta)

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
