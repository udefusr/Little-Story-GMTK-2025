class_name TaskArea
extends Area2D

@export var area_for: String
var status: bool = false
var tasks: int

func check():
	var overlapping_areas = get_overlapping_areas()
	var valid_tasks = 0

	for area in overlapping_areas:
		if area is Task:
			if area.task_really_for != area_for:
				print("❌ Wrong task in", area_for, ": got", area.task_really_for)
				status = false
				tasks = 0
				return  # Early return if any mismatch
			valid_tasks += 1
	
	status = true
	tasks = valid_tasks
	print("✅", area_for, "is correct with", tasks, "tasks.")
