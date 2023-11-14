extends Node2D

func _ready():
	$VBoxContainer/back.grab_click_focus()

func _on_back_pressed():
	get_tree().change_scene_to_file("res://scene/menu/menu.tscn")
