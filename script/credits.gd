extends Control

var scroll_time = 7
var credits_music = load("res://music/menu music.mp3")

func _ready():
	play_credits_music()

func _on_back_pressed():
	get_tree().change_scene_to_file("res://scene/menu/menu.tscn")

func _process(delta):
	scroll_time -= 0.01
	while(scroll_time > 0):
		position.y += 0.01
		await get_tree().create_timer(0.001).timeout
	if scroll_time <= 0:
		get_tree().change_scene_to_file("res://scene/menu/menu.tscn")
	
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

func play_credits_music():
	$music.volume_db = -20
	$music.stream = credits_music
	$music.play()
