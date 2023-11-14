extends Node2D

var laugh = load("res://music/y2mate.com - Scary Laugh Sound Effect-[AudioTrimmer.com].mp3")

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN
	global.ended = 1
	global.caged = 1
	await get_tree().create_timer(2).timeout
	play_laugh()

func play_laugh():
	$music.volume_db = 10
	$music.stream = laugh
	$music.play()

