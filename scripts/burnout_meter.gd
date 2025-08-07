extends Node

@export var animation_player: AnimationPlayer

func fill_up():
	animation_player.play("burnout_meter_filling_up")
