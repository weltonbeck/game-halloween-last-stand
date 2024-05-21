class_name PlayerInputComponent extends InputComponent

@export var deadzone:float =  0.15

func handleMoveInputs(_delta: float) -> void: 
	input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		
	# Apagar deadzone do input vector
	if abs(input_vector.x) <deadzone:
		input_vector.x = 0.0
	if abs(input_vector.y) < deadzone:
		input_vector.y = 0.0
	
	attack_input = Input.is_action_just_pressed("ui_attack")
