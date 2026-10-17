extends CharacterBody2D

const MOVE_SPEED = 100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input_dir = Vector2()
	if Input.is_key_pressed(KEY_RIGHT):
		input_dir.x = 1
	if Input.is_key_pressed(KEY_LEFT):
		input_dir.x = -1
	position += (delta*MOVE_SPEED) * input_dir
