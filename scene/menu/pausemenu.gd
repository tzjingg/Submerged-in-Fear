extends CanvasLayer

@onready var pausemenu456 = $pausemenu456

func _ready():
	pausemenu456.visible = false
	Engine.time_scale = 1
	
func _process(delta):
	if Input.is_action_pressed("pause"):
		pausemenu456.visible = true
		Engine.time_scale = 0.0001
		
func _on_resume_pressed():
	pausemenu456.visible = false
	Engine.time_scale = 1

func _on_quit_pressed():
	get_tree().quit()
