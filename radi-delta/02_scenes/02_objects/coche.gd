extends Node2D

@export var move_speed = 200
@export var mySprite = Sprite2D
@export var myImage = Texture2D
const SCREEN_WIDTH = 1920

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mySprite.texture = myImage
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position -= Vector2(move_speed * delta, 0)
	if position.x <= 0:
		queue_free()
