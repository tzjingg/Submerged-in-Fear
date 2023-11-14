extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Musiccontroller.play_menu_music()
	$VBoxContainer/play.grab_click_focus()

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scene/lvl/lvl1.tscn")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://optionss.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_credits_pressed():
	get_tree().change_scene_to_file("res://scene/ending/credits.tscn")

func _on_play_mouse_entered():
	Musiccontroller.play_click_eff()

func _on_options_mouse_entered():
	Musiccontroller.play_click_eff()

func _on_quit_mouse_entered():
	Musiccontroller.play_click_eff()

func _on_credits_mouse_entered():
	Musiccontroller.play_click_eff()

func _on_play_mouse_exited():
	Musiccontroller.play_menu_music()

func _on_options_mouse_exited():
	Musiccontroller.play_menu_music()

func _on_quit_mouse_exited():
	Musiccontroller.play_menu_music()

func _on_credits_mouse_exited():
	Musiccontroller.play_menu_music()
