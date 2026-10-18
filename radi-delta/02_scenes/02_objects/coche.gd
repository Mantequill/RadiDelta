extends Node2D

@export var move_speed = 200
#@export var mySprite = Sprite2D
#@export var myImage = Texture2D
@export var mySprite = Sprite2D
@export var isCar = true

const SCREEN_WIDTH = 1920
var carNum = 0
@onready var myTextures: Array = [
	preload("res://01_assets/01_sprites/MikuCar.png"),
	preload("res://01_assets/01_sprites/PinkCar.png"),
	preload("res://01_assets/01_sprites/YellowCar.png"),
	preload("res://01_assets/01_sprites/PurpleCar.png"),
	preload("res://01_assets/01_sprites/PoliceCar.png")
]

@onready var myTexturesBus: Array = [
	preload("res://01_assets/01_sprites/BusSalsa.png"),
	preload("res://01_assets/01_sprites/BusUdc.png")
]
var myImage = Texture2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#spritenum = randi() % 2
	#if spritenum == 0:
	#	dollar.visible = true
	#if spritenum == 1:
	#	burger.visible = true
	#print("SPAWN")
	if isCar:
		myImage = myTextures.pick_random()
		mySprite.texture = myImage
	else:
		myImage = myTexturesBus.pick_random()
		mySprite.texture = myImage
		
	if not isCar:
		pass
	pass # Replace with function body.

func _on_cooldown_bus():
	position = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
#	carNum = randi() % 4
#	if carNum == 0:
#		yellowCar.visible = 1
#	if carNum == 1:
#		pinkCar.visible = 1
#	if carNum == 2:
#	if carNum == 3:
#		purpleCar.visible = 1
#		mikuCar.visible = 1
#	if carNum == 4:
#		policeCar.visible = 1
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	position -= Vector2(move_speed * delta, 0)
	if position.x <= 0:
		queue_free()


func _on_timer_wait_bus_timeout() -> void:
	pass # Replace with function body.
