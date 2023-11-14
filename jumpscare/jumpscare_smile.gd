extends Node2D

var jumpscare_eff = load("res://music/jump-scare-bell-strike-glitchedtones-heavy-bell-2-00-06.mp3")

func _ready():
	global.dead = 1
	$CanvasLayer/time.text = str("you survived for ",global.time)
	play_jumpscare_eff()
	await get_tree().create_timer(3.0).timeout
	get_tree().change_scene_to_file("res://scene/lvl/lvl_1.tscn")

func play_jumpscare_eff():
	$music.volume_db = -15
	$music.stream = jumpscare_eff
	$music.play()
