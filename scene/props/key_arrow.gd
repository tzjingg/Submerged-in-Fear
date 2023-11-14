extends Sprite2D

func _ready():
	self.visible = false

func _process(delta):
	if global.key_collected == 1 and self.global_position.distance_to(get_parent().get_parent().get_parent().get_node("lock").global_position) > 300:
		self.visible = true
		look_at(get_parent().get_parent().get_parent().get_node("lock").global_position)
	else:
		if global.lock_opened == 1:
			queue_free()
		else: 
			self.visible = false
