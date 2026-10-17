extends Node2D

@export var mySprite = Sprite2D
var myTextures: Array = [
	preload("res://01_assets/01_sprites/collectible_placeholder.png"),
	preload("res://01_assets/01_sprites/collectible2_placeholder.png"),
	preload("res://01_assets/01_sprites/collectible3_placeholder.png")
]
var myImage = Texture2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("SPAWN")
	myImage = myTextures.pick_random()
	mySprite.texture = myImage
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
