extends CanvasLayer

func open() -> void:
	$AnimationPlayer.play("fade_out")
	await $AnimationPlayer.animation_finished
	
func close() -> void:
	$AnimationPlayer.play("fade_in")
	await $AnimationPlayer.animation_finished
