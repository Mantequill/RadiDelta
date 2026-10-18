extends Camera2D

var t = 0.0
var scroll_speed = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if scroll_speed < 1800:
		scroll_speed += 1/(t*30+1)
	t += delta *0.005
	position.x += scroll_speed*delta
