extends Area2D

@onready var anim = $AnimatedSprite2D
var collected = load("res://music/y2mate.com - sound effect coin.mp3")

func _ready():
	anim.play("default")
	global.key_collected = 0

func _on_body_entered(body):
	if body.name == "player":
		if global.key_collected == 0:
			var tween = create_tween()
			global.key_collected += 1
			play_collected()
			tween.tween_property(self, "position", position + Vector2(0, -30), 0.5)
			tween.tween_property(self, "modulate:a", 0.0, 0.5)
			tween.tween_callback(self.queue_free)

func play_collected():
	$music.stream = collected
	$music.volume_db = 20
	$music.play()
