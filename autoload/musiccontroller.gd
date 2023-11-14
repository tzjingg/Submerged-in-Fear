extends Node

var b_music = load("res://music/y2mate.com - Mysterious Ambient Background Music  The Rake.mp3")
var click_eff = load("res://music/click.mp3")
var menu_music = load("res://music/menu music.mp3")
var background_music =  load("res://music/scary-spooky-creepy-horror-ambient-dark-piano-cinematic-115052.mp3")

func play_b_music():
	$music.stream = b_music
	$music.play()

func play_click_eff():
	$music.stream = click_eff
	$music.play()

func play_menu_music():
	$music.stream = menu_music
	$music.play()
	
func play_music():
	$music.volume_db = -30
	$music.stream = background_music
	$music.play()

func _process(delta):
	if global.ended == 1 or global.jumpscare == 1 or global.dead == 1:
		$music.stream_paused = true
	else:
		$music.stream_paused = false
