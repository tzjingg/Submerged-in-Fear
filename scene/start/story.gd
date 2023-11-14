extends Node2D

var click = load("res://music/click.mp3")

func _ready():
	$MarginContainer/ScrollContainer/HBoxContainer/VBoxContainer/Label.visible_ratio = 0
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED

func _process(delta):
	$MarginContainer/ScrollContainer/HBoxContainer/VBoxContainer/Label.visible_ratio += 0.001
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

func _on_skip_button_down():
	get_tree().change_scene_to_file("res://scene/lvl/lvl_1.tscn")

func click_eff():
	$music.stream = click
	$music.volume_db = 0
	$music.play()

func _on_skip_mouse_entered():
	click_eff()
