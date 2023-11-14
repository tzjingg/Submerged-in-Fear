extends Node2D

@onready var collision_polygon_2d = $StaticBody2D/CollisionPolygon2D
@onready var polygon_2d = $StaticBody2D/CollisionPolygon2D/Polygon2D
@onready var collision_polygon_2d2 = $StaticBody2D2/CollisionPolygon2D
@onready var polygon_2d2 = $StaticBody2D2/CollisionPolygon2D/Polygon2D

func _ready():
	polygon_2d.polygon = collision_polygon_2d.polygon
	polygon_2d2.polygon = collision_polygon_2d2.polygon

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scene/lvl/lvl1.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_main_scene_pressed():
	get_tree().change_scene_to_file("res://scene/menu/menu.tscn")

func _on_credits_pressed():
	get_tree().change_scene_to_file("res://scene/ending/credits.tscn")
	
func _on_play_mouse_entered():
	Musiccontroller.play_click_eff()

func _on_main_scene_mouse_entered():
	Musiccontroller.play_click_eff()

func _on_quit_mouse_entered():
	Musiccontroller.play_click_eff()

func _on_credits_mouse_entered():
	Musiccontroller.play_click_eff()

func _on_play_mouse_exited():
	Musiccontroller.play_b_music()

func _on_main_scene_mouse_exited():
	Musiccontroller.play_b_music()

func _on_quit_mouse_exited():
	Musiccontroller.play_b_music()

func _on_credits_mouse_exited():
	Musiccontroller.play_b_music()
