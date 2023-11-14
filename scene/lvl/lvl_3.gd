extends Node2D

var entered = false

func _on_area_2d_body_entered(body: PhysicsBody2D):
	entered = true

func _on_area_2d_body_exited(body):
	entered = false

func _process(delta):
	if entered == true: 
		$anim.play("fade_in")

func _on_anim_animation_finished(anim_name):
	global.next_scene = 1
	get_tree().change_scene_to_file("res://scene/lvl/lvl_4.tscn")
	$anim.play("fade_out")


