extends Node2D

@export var audio_my : AudioStreamPlayer

func begin():
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func exit():
	get_tree().quit()


func _on_button_pressed() -> void:
	audio_my.play()
	begin()


func _on_button_2_pressed() -> void:
	audio_my.play()
	
	exit()
