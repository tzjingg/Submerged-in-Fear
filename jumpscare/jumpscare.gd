extends Sprite2D

var jumpscare_eff = load("res://music/HAL9K - Piercing.wav")

func _ready():
	global.jumpscare = 1
	self.visible = true
	play_jumpscare_eff()
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://scene/die/death.tscn")
	
func play_jumpscare_eff():
	$music.stream = jumpscare_eff
	$music.play()
