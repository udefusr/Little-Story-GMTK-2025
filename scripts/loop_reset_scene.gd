extends Node2D

func change_to_scene():
	if (Global.day == 1):
		get_tree().change_scene_to_file("res://scenes/main.tscn")
	elif (Global.day == 2):
		get_tree().change_scene_to_file("res://scenes/day_2.tscn")
	elif Global.day == 3:
		get_tree().change_scene_to_file("res://scenes/day_3.tscn")
	elif Global.day == 4:
		get_tree().change_scene_to_file("res://scenes/day_4.tscn")
