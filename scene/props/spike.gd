extends Node2D

var time = 0
var spiked = false

func _process(delta):
	while(spiked):
		_spike()
		await get_tree().create_timer(0.01).timeout

func _on_area_2d_body_entered(body):
	if body.get_name() == "player":
		spiked = true

func _on_area_2d_body_exited(body):
	spiked = false

func _spike():
	get_tree().call_group("player","damage_spike")

