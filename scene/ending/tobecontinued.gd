extends Node2D

var bell = load("res://music/jump-scare-bell-strike-glitchedtones-heavy-bell-2-00-06.mp3")

func _ready():
	play_music()
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://scene/ending/credits.tscn")

func play_music():
	$music.volume_db = -10
	$music.stream = bell
	$music.play()
