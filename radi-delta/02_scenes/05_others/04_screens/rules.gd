extends Node2D



func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://02_scenes/04_screens/main_menu.tscn")
