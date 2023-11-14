extends Area2D

var player_hit
var vacuum = load("res://music/y2mate.com - vacuum cleaner loop  Sound Effect.mp3")
@onready var pos = $".."

func _ready():
	player_hit = false

func _process(_delta):
	while(player_hit):
		get_tree().call_group("player","vacuum")
		await get_tree().create_timer(0.001).timeout

func play_vacuum():
	$music.volume_db = -20
	$music.stream = vacuum
	$music.play()

func _on_body_entered(body):
	if body.name == "player":
		player_hit = true

func _on_body_exited(body):
	if body.name == "player":
		player_hit = false

func _on_vacuum_sfx_body_entered(body):
	if body.name == "player":
		play_vacuum()
		$music.stream_paused = false

func _on_vacuum_sfx_body_exited(body):
	$music.stream_paused = true 
