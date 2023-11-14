extends Area2D

func _ready():
	$AnimationPlayer.play("normal")

func _on_body_entered(body):
	Checkpoint.last_position = global_position
	$AnimationPlayer.play("cp")
