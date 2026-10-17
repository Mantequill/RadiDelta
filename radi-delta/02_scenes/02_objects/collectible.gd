extends Node2D

@export var mySprite = Sprite2D
@export var myImage = ["res://01_assets/01_sprites/collectible_placeholder.png","res://01_assets/01_sprites/collectible2_placeholder.png","res://01_assets/01_sprites/collectible3_placeholder.png"]
var myTexture = Texture2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	myTexture = myImage.pick_random()
	mySprite.texture = myTexture
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
