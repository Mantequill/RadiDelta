extends Node2D

const MOVE_SPEED = 500

var t = 0.0

var lane_array = []
var current_lane = 0
var lane_cd_over = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lane_array = [$TopLane, $MidLane, $BotLane]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t += delta *0.005
	var player_body = $PlayerBody
	var input_dir = Vector2()
	if Input.is_key_pressed(KEY_RIGHT):
		input_dir.x = 1
	if Input.is_key_pressed(KEY_LEFT):
		input_dir.x = -1

	$move_target.position += (delta*MOVE_SPEED) * input_dir #mover target en eje x
	if lane_cd_over:
		if Input.is_key_pressed(KEY_UP) and current_lane>0:
			current_lane -= 1
		if Input.is_key_pressed(KEY_DOWN) and current_lane<2:
			current_lane +=1

		$move_target.position.y = lane_array[current_lane].position.y #mover target en eje y
		lane_cd_over = false
		$lane_cd.start()
	player_body.position = player_body.position.lerp($move_target.position, t) #interpolar posición actual de gnomo con posición objetivo.

func _on_lane_cd_timeout() -> void:
	lane_cd_over = true
