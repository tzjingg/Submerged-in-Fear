extends Control

func _ready():
	self.visible = false

func _process(delta):
	self.visible = true
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
