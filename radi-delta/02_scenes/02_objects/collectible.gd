extends Node2D

@export var mySprite = Sprite2D
@onready var dollar = $RumpelDollar
@onready var burger = $DeliciousAndAppetizingHamburgerWithFreshIngredientsOnTransparentBackgroundFreePng
var spritenum = 0

@onready var myTextures: Array = [
	preload("res://01_assets/01_sprites/collectible_placeholder.png"),
	preload("res://01_assets/01_sprites/collectible2_placeholder.png"),
	preload("res://01_assets/01_sprites/collectible3_placeholder.png"), dollar, burger
]
var myImage = Texture2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spritenum = randi() % 2
	if spritenum == 0:
		dollar.visible = true
	if spritenum == 1:
		burger.visible = true
	#print("SPAWN")
	#myImage = myTextures.pick_random()
	#mySprite.texture = myImage
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	self.queue_free()
