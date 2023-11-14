extends Node2D

signal trampoline()

var entered = false

func _ready():
	global.next_scene = 0
	$hiddentile.show()

func _on_hiddenarea_body_entered(body):
	$hiddentile.hide()

func _on_hiddenarea_body_exited(body):
	$hiddentile.show()
	
func _on_area_2d_body_entered(body: PhysicsBody2D):
	entered = true

func _on_area_2d_body_exited(body):
	entered = false

func _process(delta):
	if entered == true:
		$anim.play("fade_in")

func _on_anim_animation_finished(anim_name):
	global.next_scene = 1
	get_tree().change_scene_to_file("res://scene/lvl/lvl_3.tscn")
	$anim.play("fade_out")

func _on_trampoline_body_entered(body):
	emit_signal("trampoline")
