extends Node2D

@export var main_scene : PackedScene

func _on_reset():
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn")
