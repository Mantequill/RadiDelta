extends Node2D

#@onready 
#@export var myPathFr = PathFollow2D

var kid_number = 0
var kid = preload("res://02_scenes/01_characters/kid.tscn")
var kids_array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	kid_number = randi_range(1,2) #CAMBIAR AL NÚMERO DE NIÑOS QUE QUERAMOS
	for i in kid_number:
		#var path_instance = myPathFr.instantiate()
		var kid_instance = kid.instantiate()
		kid_instance.position.y = randi_range($markerUp.position.y, $markerDown.position.y)
		kids_array.append(kid_instance)
		#$Crossroad_area/Path2D/childPath.add_child(kid_instance)
		self.add_child(kid_instance)
	#Queda hacer que compruebe que no es el mismo tipo de niño mmmaybe
	pass
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in kid_number:
		if kids_array[i-1].position.y >= $markerDown.position.y: #pos niño = posicion y abajo -- false y si está en false es -1
			kids_array[i-1].direction_up = false
		if kids_array[i-1].position.y <= $markerUp.position.y:
			kids_array[i-1].direction_up = true
			
		if kids_array[i-1].direction_up:
			kids_array[i-1].position.y += 1
		else:
			kids_array[i-1].position.y -= 1
		
		#kids_array[i-1].position.y += 1
		#pass
		#if kids_array[i-1].get_parent().progress_ratio < 1:
			#kids_array[i-1].get_parent().progress_ratio += delta*0.3
		#else:
			#kids_array[i-1].get_parent().progress_ratio -= delta*0.3
			
	
	pass
