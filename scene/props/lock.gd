extends Sprite2D

var open = load("res://music/door.mp3")

func _ready():
	self.visible = true
	$e.visible = false
	$lock.visible = false
	$CharacterBody2D/CollisionShape2D.disabled = false

func _process(_delta):
	if abs(global.player_pos.distance_to(self.global_position)) < 150:
		if global.key_collected == 1:
			$e.visible = true
			$lock.visible = false
		elif global.key_collected == 0:
			$lock.visible = true
			$e.visible = false
		if Input.is_action_just_pressed("enter_door"):
			if global.key_collected == 1:
				$CharacterBody2D/CollisionShape2D.disabled = true
				self.visible = false
				global.lock_opened = 1
				play_music()
	else:
		$e.visible = false
		$lock.visible = false
		
func play_music():
	$music.stream = open
	$music.volume_db = 20
	$music.play()

func _on_music_finished():
	queue_free()
