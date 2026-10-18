extends Node2D

#@onready 
var kid_number = 0
var kid = preload("res://02_scenes/01_characters/kid.tscn")
var kids_array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	kid_number = randi_range(1,2) #CAMBIAR AL NÚMERO DE NIÑOS QUE QUERAMOS
	for i in kid_number:
		var kid_instance = kid.instantiate()
		kid_instance.position.y = randi_range($markerUp.position.y, $markerDown.position.y)
		kids_array.append(kid_instance)
		self.add_child(kid_instance)
	#Queda hacer que compruebe que no es el mismo tipo de niño mmmaybe
	pass
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in kid_number:
		kids_array[i-1].position.y += 1 #variable = -variable?? GELP
		pass
		
	pass
