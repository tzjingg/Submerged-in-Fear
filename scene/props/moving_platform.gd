extends AnimatableBody2D

@export var distance:Vector2
@export var phase_time:float = 6.0
@export_range(0.0, 1.0) var phase_offset:float
@export var debug:bool = true

var pivot:Vector2
var time:float

func _ready():
	pivot = global_position
	set_process(debug)

func get_pos(t:float)->Vector2:
	var x:float = pivot.x + cos(TAU * (t + phase_offset)) * distance.x
	var y:float = pivot.y + sin(TAU * t) * distance.y
	return Vector2(x, y)

func _physics_process(delta:float):
	time = fmod(time + delta/phase_time, 1.0)
	global_position = get_pos(time)

func _process(delta):
	queue_redraw()
