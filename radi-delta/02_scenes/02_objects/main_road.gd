extends Node2D
var roadnum = 0
@onready var road1 = $Road001V02
@onready var road2 = $Road002V02
@onready var road3 = $Road003V02
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	roadnum = randi() % 3
	if roadnum == 0:
		road1.visible = 1
	if roadnum == 1:
		road2.visible = 1
	if roadnum == 2:
		road3.visible = 1
