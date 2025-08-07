class_name FeedbackManager
extends Node

var feedback_label : PackedScene = preload("res://prefabs/npc_feedback.tscn")

func _ready() -> void:
	Global.feedback_given.connect(_on_feedback_given)

func _on_feedback_given(name : String, n: int):
	var new = feedback_label.instantiate()
	get_parent().add_child(new)
	new.updateInfo(name, n)
