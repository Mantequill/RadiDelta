extends Node2D

@onready var musica_jam_epica_01: AudioStreamPlayer = $MusicaJamEpica01

func _ready():
	$MusicaJamEpica01.stop()
	$Muerte.play()
	$Label2.set_text("Tiempo total:" + str(Global.tiempo))
	$Label3.set_text("Caramelos recogidos:" + str(Global.caramelos))
func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_retry_pressed() -> void:
	Global.caramelos = 0
	Global.tiempo = 0
	get_tree().change_scene_to_file("res://02_scenes/03_levels/main.tscn")
