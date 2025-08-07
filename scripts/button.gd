extends Button

@export var click_audio : AudioStreamPlayer

func _on_mouse_entered() -> void:
	click_audio.play()
