extends Node2D

func _on_area_2d_body_entered(body):
	if body.name == "player":
		global.trampoline_touched = 1
		global.trampoline_rotation = self.rotation

func _on_area_2d_body_exited(body):
	global.trampoline_touched = 0
