extends Label

func _process(delta):
	self.text = str("fps:",Engine.get_frames_per_second())
