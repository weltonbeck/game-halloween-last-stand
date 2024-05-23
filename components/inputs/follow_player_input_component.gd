class_name FollowPlayerInputComponent extends InputComponent

@export var min_distance:float =  10.0

func handleMoveInputs(_delta: float) -> void:
	if (PlayerManager && PlayerManager.player):
		var player_position = PlayerManager.player.global_position
		var distance = global_position.distance_to(player_position)
		if (distance >= min_distance):
			input_vector = global_position.direction_to(player_position).normalized()
		else:
			input_vector = Vector2.ZERO
