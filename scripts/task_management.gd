class_name TaskManagement
extends Node2D

@export var task_areas: Array[TaskArea]
@export var total_tasks: int

signal on_task_completed
signal on_task_failed

var can_interact: bool = true

func checksum_total_task() -> int:
	var task_count = 0
	for task_area in task_areas:
		task_count += task_area.tasks
	return task_count

func check() -> void:
	var total_task_done = checksum_total_task()
	var all_correct = true

	for task_area in task_areas:
		if not task_area.status:
			all_correct = false
			break

	print("✅ Total Tasks Done:", total_task_done, "/", total_tasks)
	print("✅ All Statuses Correct:", all_correct)

	if total_task_done == total_tasks and all_correct:
		print("🎉 Success!")
		on_task_completed.emit()
	else:
		print("❌ Task Failed")
		on_task_failed.emit()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("task_check") and can_interact:
		for task_area in task_areas:
			task_area.check()
		
		check()
		can_interact = false
