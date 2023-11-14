extends AnimatableBody2D

var rng = RandomNumberGenerator.new()
var num = rng.randi_range(0,1)

func _ready():
	rng.randomize()

func _process(delta):
	if num == 0.0:
		rotate(0.005)
	elif num == 1.0:
		rotate(-0.005)
