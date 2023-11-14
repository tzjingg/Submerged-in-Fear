extends CanvasLayer

var click = load("res://music/click.mp3")
var music = load("res://music/menu music.mp3")

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	global.caged = 0
	bg_music()

func _on_startbtn_button_down():
	get_tree().change_scene_to_file("res://scene/start/start.tscn")

func _on_instructionsbtn_button_down():
	get_tree().change_scene_to_file("res://scene/menu/instructions.tscn")

func _on_quitbtn_button_down():
	get_tree().quit()

func click_eff():
	$music.stream = click
	$music.volume_db = 0
	$music.play()

func bg_music():
	$bg_music.stream = music
	$bg_music.volume_db = -20
	$bg_music.play()

func _on_startbtn_mouse_entered():
	click_eff()

func _on_instructionsbtn_mouse_entered():
	click_eff()
	
func _on_quitbtn_mouse_entered():
	click_eff()

func _process(_delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

