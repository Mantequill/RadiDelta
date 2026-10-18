extends Area2D

@export var mySprite = Sprite2D
var myTextures = [
	[preload("res://01_assets/01_sprites/lagarte_happy_v02.png"), #niño 1
	preload("res://01_assets/01_sprites/lagarte_sad_v02.png")],
	[preload("res://01_assets/01_sprites/non_happy_v02.png"), #niño 2
	preload("res://01_assets/01_sprites/non_sad_v02.png")],
	[preload("res://01_assets/01_sprites/enigmag_happy_v01.png"), #niño 3
	preload("res://01_assets/01_sprites/enigmag_sad_v01.png")],
	[preload("res://01_assets/01_sprites/lluna_happy_v01.png"), #niño 4
	preload("res://01_assets/01_sprites/lluna_sad_v01.png"),],
	[preload("res://01_assets/01_sprites/mantequill_happy_v01.png"), #niño 5
	preload("res://01_assets/01_sprites/mantequill_sad_v01.png")]
]
var current_number = 0
var next_to_player = false
var direction_up = true

const KID_NUMBER = 4 #Esto es uno menos de los que hay realmente !!!!

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#self.rotation = 90
	current_number = randi_range(0,KID_NUMBER)
	mySprite.texture = myTextures[current_number][0]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_E) and next_to_player:
		_on_kid_killed()
	#if Input.is_key_pressed(KEY_RIGHT):
		#_on_kid_killed()
	#que el area se mueva arriba y abajo modo ping pong

func _on_area_entered(area):
	if area.is_in_group("player02"):
		next_to_player = true

func _on_kid_killed():
	mySprite.texture = myTextures[current_number][1]
