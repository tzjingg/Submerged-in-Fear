extends Node2D

var entered = false

func _ready():
	Musiccontroller.play_music()
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN
	global.dead = 0
	global.ended = 0
	global.jumpscare = 0
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
		global.door_entered = 1
	elif entered == false:
		global.door_entered = 0
	
	if global.door_entered == 1:
		get_tree().change_scene_to_file("res://scene/ending/cage.tscn")
