extends CanvasLayer

@export var player:Player

var health_component: HealthComponent

func _ready() -> void:
	if (player):
		health_component = player.get_node("HealthComponent")
		if (health_component):
			health_component.die.connect(open)
	hide()

func open() -> void:
	get_tree().paused = true
	if (GameManager):
		await GameManager.transition.close()
	draw_text()
	show()
	if (GameManager):
		await GameManager.transition.open()


func draw_text() -> void:
	$Wave/RichTextLabel.text = "[center]WAVE: " + str(GameManager.wave).pad_zeros(3) + "[/center]"
	$Kills/RichTextLabel.text = "[center]KILLS: " + str(GameManager.monster_died).pad_zeros(4) + "[/center]"
	
func close() -> void:
	get_tree().paused = false
	if (GameManager):
		GameManager.title_game()
