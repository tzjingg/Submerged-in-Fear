extends CanvasLayer

var click  = load("res://music/click.mp3")

func _on_button_button_down():
	get_tree().change_scene_to_file("res://scene/menu/menu.tscn")

func _on_button_mouse_entered():
	click_eff()

func click_eff():
	$music.stream = click
	$music.volume_db = 0
	$music.play()

func _process(_delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

