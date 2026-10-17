extends Node2D

const MOVE_SPEED = 100

var lane_array = []
var current_lane = 0
var lane_cd_over = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lane_array = [$TopLane.transform, $MidLane.transform, $BotLane.transform]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player_body = $PlayerBody
	var input_dir = Vector2()
	if Input.is_key_pressed(KEY_RIGHT):
		input_dir.x = 1
	if Input.is_key_pressed(KEY_LEFT):
		input_dir.x = -1

	player_body.position += (delta*MOVE_SPEED) * input_dir
	if lane_cd_over:
		if Input.is_key_pressed(KEY_UP) and current_lane>0:
			current_lane -= 1
		if Input.is_key_pressed(KEY_DOWN) and current_lane<2:
			current_lane +=1

		
		player_body.transform = lane_array[current_lane]
		lane_cd_over = false
		$lane_cd.start()

func _on_lane_cd_timeout() -> void:
	lane_cd_over = true
