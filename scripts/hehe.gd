extends AudioStreamPlayer

@export var main_node : Node2D

var can_play : bool = true

func _process(delta: float) -> void:
	print(main_node.is_visible_in_tree())
	if main_node.is_visible_in_tree() and can_play:
		play()
		can_play = false
		
