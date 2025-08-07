class_name Interactable
extends Area2D

@export var interactable : bool = true
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _ready():
	connect("input_event", Callable(self, "_on_input_event"))

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and interactable:
		print()
		get_tree().paused = true
		if self.has_method("on_interact"):
			interactable = false
			self.call_deferred("on_interact")
		get_tree().paused = false


func _on_mouse_entered() -> void:
	scale = Vector2(1.15, 1.15)
	audio_stream_player.play()


func _on_mouse_exited() -> void:
	scale = Vector2(1.0, 1.0)
	
	audio_stream_player.stop()
