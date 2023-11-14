extends Panel

var time: float = 0.0
var min: int = 0
var sec: int = 0
var msec: int = 0

func _process(delta):
	time += delta
	msec = fmod(time, 1) * 100
	sec = fmod(time, 60)
	min = fmod(time, 3600) / 60
	$min.text = "%02d." % min
	$sec.text = "%02d." % sec
	$msec.text = "%03d" % msec

func stop():
	set_process(false)

func get_time_formatted() -> String:
	return "%02d.%02d.%03d" % [min, sec, msec]
