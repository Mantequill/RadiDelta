extends Node2D

const SCREEN_WIDTH = 1920
const SCREEN_HEIGHT = 1080
var coche = preload("res://02_scenes/02_objects/coche.tscn") 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func spawn_coche():
	var stage_node = get_parent()
	var coche_instance = coche.instantiate()
	coche_instance.position = Vector2(randi_range(0,SCREEN_WIDTH), randi_range(0, SCREEN_HEIGHT))	
	stage_node.add_child(coche_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_UP):
		spawn_coche()
