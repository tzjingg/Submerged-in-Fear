extends Node2D

signal trampoline_jump()

@onready var shieldtimer := $player/shield_timer
@onready var shieldsprite := $player/shield

@export var dmg_shield_time := 5.0

const MAX_HEALTH = 100

var health = MAX_HEALTH
var shield_cooldown = 10.0

func _ready():
	$player/Camera2D.zoom = Vector2(1.0,1.0)
	set_health_bar()
	shieldsprite.visible = false
	while(true):
		if Input.is_action_just_pressed("invert"):
			if shield_cooldown >= 10:
				shieldtimer.start(dmg_shield_time)
				shieldsprite.visible = true
				shield_cooldown = 0
				_shield_cooldown()
		await get_tree().create_timer(0.001).timeout

func _shield_cooldown():
	while(shield_cooldown < 10):
		shield_cooldown += 0.02
		await get_tree().create_timer(0.001).timeout

func set_health_bar():
	$hud/health_bar.value = health
	$hud/health_bar.max_value = MAX_HEALTH

func damage_spike():
	if !shieldtimer.is_stopped():
		return	
	health -= 0.1
	set_health_bar()

func crawl_smile():
	if !shieldtimer.is_stopped():
		return
	
	global.time = str(get_parent().get_node("ui/timer/min").text,get_parent().get_node("ui/timer/sec").text,get_parent().get_node("ui/timer/msec").text)
	get_tree().change_scene_to_file("res://jumpscare/jumpscare.tscn")

func vacuum():
	if !shieldtimer.is_stopped():
		return
	
	health -= 50
	set_health_bar()

func death():
	get_tree().change_scene_to_file("res://scene/die/death.tscn")
	
func _on_lvl_2_trampoline():
	emit_signal("trampoline_jump")

func _process(delta):
	if health < 100:
		health += 0.1
		set_health_bar()
		
	if health > 100:
		health = 100
		set_health_bar()
		
	if !shieldtimer.is_stopped():
		return
		
	health -= global.laser_hit
	set_health_bar()
	if health == 0 or health < 0:
		global.time = str(get_parent().get_node("ui/timer/min").text,get_parent().get_node("ui/timer/sec").text,get_parent().get_node("ui/timer/msec").text)
		death()
	
	if global.caged == 1:
		$hud/health_bar.visible = false
		await get_tree().create_timer(2).timeout
		$player/Camera2D.zoom = Vector2(0.5,0.5)
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://scene/ending/tobecontinued.tscn")
	else:
		$player/Camera2D.zoom = Vector2(1.0,1.0)

func _on_shield_timer_timeout():
	shieldsprite.visible = false
	$hud/health_bar.visible = true
