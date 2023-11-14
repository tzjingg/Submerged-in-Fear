extends Area2D

func _ready():
	$lvl_1/hiddentile.show()
	print(4)

func _on_body_entered(body):
	print(11221)
	$hiddentile.hide()
	
func _on_body_exited(body):
	print(22222)
	
