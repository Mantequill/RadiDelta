extends Node2D


func _ready():
	$Label2.set_text("Tiempo total:" + str(Global.tiempo))
	$Label3.set_text("Caramelos recogidos:" + str(Global.caramelos))
func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_retry_pressed() -> void:
	pass # Replace with function body.
