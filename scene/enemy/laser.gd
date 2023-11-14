extends Node2D

var max_dist = 700

@onready var player = get_parent().get_parent().get_parent().get_node("player/player")
@onready var laser_beam = $laser_center
@onready var part = $laser_particles
@onready var detect = $Area2D

func _ready():
	global.laser_hit = 0

func _physics_process(delta):
	handle_beam()
	handle_movement()
	hit()

func handle_beam():
	var ray = get_world_2d().direct_space_state
	var params = PhysicsRayQueryParameters2D.new()
	params.from = global_position
	params.to = global_position + transform.x * max_dist
	params.exclude = [self]
	params.collision_mask = 1
	var hit = ray.intersect_ray(params)
	
	if hit:
		var hit_pos = hit["position"]
		var laser_length = laser_beam.global_position.distance_to(hit_pos)
		laser_beam.scale.x = laser_length
		part.show()
		part.global_position = hit_pos
	else:
		part.hide()
		laser_beam.scale.x = max_dist
		
func handle_movement():
	if laser_beam.global_position.distance_to(player.position) < max_dist:
		laser_beam.visible = true
		detect.visible = true
		part.visible = true
		look_at(player.position)
		await get_tree().create_timer(0.0001).timeout
	else:
		laser_beam.visible = false
		part.visible = false
		detect.visible = false

func hit():
	detect.global_position = part.global_position

func _on_area_2d_body_entered(body):
	if body.name == "player":
		global.laser_hit = 0.7
		
func _on_area_2d_body_exited(body):
	if body.name == "player":
		global.laser_hit = 0
