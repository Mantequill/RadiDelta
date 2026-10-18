extends Node2D

@onready var musica_jam_epica_01: AudioStreamPlayer = $MusicaJamEpica01

var puntuaciónTotal = Global.caramelos * Global.tiempo * Global.colec

func _ready():
	Global.pararMusica()
	$Muerte.play()
	$Label2.set_text("Tiempo total: " + str(Global.tiempo) + "segundos")
	$Label3.set_text("Puntuación total: " + str(puntuaciónTotal))
func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_retry_pressed() -> void:
	Global.caramelos = 0
	Global.tiempo = 0
	Global.playMusica()
	get_tree().change_scene_to_file("res://02_scenes/03_levels/main.tscn")
