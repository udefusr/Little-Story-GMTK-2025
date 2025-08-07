class_name Task
extends Area2D

@export var task_name : String
@export var task_really_for : String
@export var task_label : String
var dragging := false
var drag_offset := Vector2.ZERO
@onready var label: Label = $Label

func _ready() -> void:
	label.text = task_label

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			if is_mouse_over():
				dragging = true
				drag_offset = global_position - get_global_mouse_position()
		else:
			dragging = false

	elif event is InputEventMouseMotion and dragging:
		global_position = get_global_mouse_position() + drag_offset

func is_mouse_over() -> bool:
	var space_state = get_world_2d().direct_space_state

	var query := PhysicsPointQueryParameters2D.new()
	query.position = get_global_mouse_position()
	query.collide_with_areas = true
	query.collide_with_bodies = false

	var result = space_state.intersect_point(query, 5)
	for hit in result:
		if hit.collider == self:
			return true
	return false
