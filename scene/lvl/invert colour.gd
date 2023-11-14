extends ColorRect

var inverted = 0
var rng = RandomNumberGenerator.new()
var num = rng.randi_range(10,20)

func _ready():
	self.visible = false
	rng.randomize()
	while(true):
		await get_tree().create_timer(num).timeout
		inverted += 1
		num = rng.randi_range(10,20)
	
func _process(delta):
	if inverted % 2 == 1:
		self.visible = true
	elif inverted % 2 == 0:
		self.visible = false
