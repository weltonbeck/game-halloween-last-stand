class_name MobSpawner
extends Node2D

@export var is_active: bool = false

@export var creatures: Array[PackedScene]
@export var mobs_per_minute: float = 20.0
@export var path_follow_2d: PathFollow2D
@export_flags_2d_physics var collision_mask

var cooldown: float = 0.0

func _process(delta: float):
	if (is_active):
		# Temporizador
		cooldown -= delta
		if cooldown > 0: return
		
		# Frequência
		var interval = 60.0 / (mobs_per_minute + (GameManager.wave * 2))
		cooldown = interval
		
		# Checar se o ponto é válido
		var point = get_point()
		var world_state = get_world_2d().direct_space_state
		var parameters = PhysicsPointQueryParameters2D.new()
		parameters.position = point
		parameters.collision_mask = collision_mask
		var result: Array = world_state.intersect_point(parameters, 1)
		if not result.is_empty(): return
		
		# Instanciar uma criatura aleatória
		var creatures_limit = creatures.size() - 1
		
		if (GameManager.wave <= 1):
			creatures_limit = 0
		elif (GameManager.wave <= 5):
			creatures_limit = 1
			
		var index = randi_range(0, creatures_limit)
		var creature_scene = creatures[index]
		var creature = creature_scene.instantiate()
		creature.global_position = point
		get_parent().get_parent().add_child(creature)

func get_point() -> Vector2:
	path_follow_2d.progress_ratio = randf()
	return path_follow_2d.global_position
