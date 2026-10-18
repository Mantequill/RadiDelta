extends Node2D

const SPAWN_HEIGHT = 456 #copiado de spawner
const SPAWN_ADD = 237

const MOVE_SPEED = 500
const BUS_SPEED = 1500

var scroll_speed = 100

var t = 0.0

var candy_count = 0
var lane_array = []
var current_lane = 1
var lane_cd_over = true
var is_hit = false

@onready var player_body = $PlayerArea
var input_dir = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lane_array = [$TopLane, $MidLane, $BotLane]
	$TopLane.position.y = SPAWN_HEIGHT
	$MidLane.position.y = SPAWN_HEIGHT + SPAWN_ADD
	$BotLane.position.y = SPAWN_HEIGHT + (SPAWN_ADD*2)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t += delta *0.005
	input_dir = Vector2()
	if Input.is_key_pressed(KEY_RIGHT) and not(is_hit):
		input_dir.x = 1
	if Input.is_key_pressed(KEY_LEFT) and not(is_hit):
		input_dir.x = -1

		#velocity = (delta*MOVE_SPEED) * input_dir 
		#$move_target.position += velocity
	$move_target.position += (delta*MOVE_SPEED) * input_dir #mover target en eje x
	if lane_cd_over and not(is_hit):
		if Input.is_key_pressed(KEY_UP) and current_lane>0: #and not hit?
			current_lane -= 1
		if Input.is_key_pressed(KEY_DOWN) and current_lane<2:
			current_lane +=1

		$move_target.position.y = lane_array[current_lane].position.y #mover target en eje y
		lane_cd_over = false
		$lane_cd.start()
	player_body.position = player_body.position.lerp($move_target.position, delta*50) #interpolar posición actual de gnomo con posición objetivo.
	self.position.x += scroll_speed*t # mover """"cámara""""
	if is_hit:
		$move_target.position.x -= scroll_speed*t # mover """"cámara""""

func _on_lane_cd_timeout() -> void: #cooldown spammear arriba abajo
	lane_cd_over = true
	
func _on_timer_hit_timeout():
	is_hit = false
	$PlayerArea/gnolderSprite.play("default")
	
func _on_player_area_entered(area):
	if area.is_in_group("vehicle"): #COCHES
		is_hit = true
		print("COCHE COCHE COCHE")
		$PlayerArea/gnolderSprite.play("damage") #cambiar sprite jugador
		if area.is_in_group("bus"): #BUS
			print("BUUUUUS")
			input_dir.x = -1 #ESTO ESTÁ FATAL HECHO VALE
			$move_target.position.x -= BUS_SPEED*t
			candy_count -= 9
		else: #OTROS COCHES
			print("COCHEEEE")
			input_dir.x = -1 #ESTO ESTÁ FATAL TB
			$move_target.position.x -= scroll_speed*t
			candy_count -= 6
		
func _on_player_steal():
	pass
	#cambiar sprite
	#cooldown
	#si está en rango
	
