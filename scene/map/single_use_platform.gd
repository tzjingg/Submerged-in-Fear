extends CharacterBody2D

var is_fall
var motion = Vector2()
var time = 1

func _ready():
	pass
func _physics_process(delta):
	if is_fall == false:
		motion.y += 20
	elif is_fall == true:
		position.y = 0
	motion = move_and_slide()
	
func _on_area_2d_body_entered(body):
	if body.name == 'player':
		time += 1
		$Sprite2D.position+= Vector2(0, sin(time) * 2)

func fall():
	is_fall = false

func _on_area_2d_body_exited(body):
	is_fall = true
