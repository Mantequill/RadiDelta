extends Node2D

var prueba = "hola"
var tiempo = Global.tiempo

func _ready():
	print (tiempo)
	$Label2.set_text("Tiempo total:" + str(tiempo))
	print (tiempo)
	$Label3.set_text("Caramelos recogidos:" + prueba)
func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_retry_pressed() -> void:
	pass # Replace with function body.
