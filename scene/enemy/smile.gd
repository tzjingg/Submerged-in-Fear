extends CharacterBody2D

const JUMP_VELOCITY = -400.0

var loop = true



#FLOAT UP DOWN
#func _ready():
#	loop = true
#	_physics_process(false)
#	while(true):
#		velocity.y = JUMP_VELOCITY / 2
#		await get_tree().create_timer(0).timeout
#	_physics_process(true)
#
#func _physics_process(delta):
#	move_and_slide()
#	while(true):
#		if loop == true:
#			velocity.y = JUMP_VELOCITY
#		elif loop == false:
#			velocity.y = -JUMP_VELOCITY
#		await get_tree().create_timer(0).timeout
#
#func _process(delta):
#	if loop == true:
#		await get_tree().create_timer(0.3).timeout
#		loop = false
#	elif loop == false:
#		await get_tree().create_timer(0.3).timeout
#		loop = true
