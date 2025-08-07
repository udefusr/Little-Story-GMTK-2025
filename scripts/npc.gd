class_name NPC
extends Area2D

@export var character_name: String
@export var timeline_to_play: String
var interactable : bool = true
@onready var label: Label = $Label

func _ready():
	connect("input_event", Callable(self, "_on_input_event"))
	label.text = character_name

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and interactable:
		print()
		get_tree().paused = true
		await Dialogic.start(timeline_to_play)
		get_tree().paused = false
		interactable = false
