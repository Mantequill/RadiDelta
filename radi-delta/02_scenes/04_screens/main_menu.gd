extends Node2D

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://02_scenes/05_others/qte.tscn")


func _on_rules_pressed() -> void:
	get_tree().change_scene_to_file("res://02_scenes/04_screens/Rules.tscn")

func _on_quit_pressed() -> void:
	$ButtonManager/Deadsound.play()

func _on_deadsound_finished() -> void:
	get_tree().quit() 
