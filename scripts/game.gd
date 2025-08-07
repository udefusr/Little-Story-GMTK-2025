extends Node2D

@export var time_to_start : String
@onready var npcs: Node2D = $NPCs
@export var task_management: TaskManagement
@export var burnout_meter : Node
@onready var audio_bg: AudioStreamPlayer = %Audio_BG
@export var lightFG : PointLight2D
func _ready() -> void:
	Dialogic.connect("signal_event", Callable(self, "_on_dialogic_signal"))
	if (task_management):
		task_management.on_task_completed.connect(_on_task_completed)
		task_management.on_task_failed.connect(on_task_failed)
	#if (Global.loops > 0):
		#Dialogic.start(time_to_start + "_repeat")
	Dialogic.start(time_to_start)

func _on_task_completed():
	task_management.visible = false
	if (Global.day == 1):
		Dialogic.start("loop_1_task_management_success")
	elif Global.day == 2:
		Dialogic.start("day_2_task_success")
	
func on_task_failed():
	task_management.visible = false
	if (Global.day == 1):
		Dialogic.start("loop_1_task_management_failed")
	elif (Global.day == 2):
		Dialogic.start("day_2_task_management_failed")

func _on_dialogic_signal(event_name: String):
	if event_name == "loop_reset":
		print("loop_reset")
		Global.reset_loop()
		get_tree().change_scene_to_file("res://scenes/loop_reset.tscn")
	if event_name == "team_arrived":
		print("team arrived")
		if npcs:
			npcs.visible = true
		if lightFG:
			lightFG.visible = false
	if event_name == "task_management_event":
		print("task management event started")
		task_management.visible = true
	if event_name == "loop_2":
		Dialogic.start("loop_2_start")
	if event_name == "day_2":
		Global.day = 2
		get_tree().change_scene_to_file("res://scenes/day_2.tscn")
	if (event_name == "burnout"):
		if burnout_meter:
			burnout_meter.fill_up()
	if event_name == "bugfix":
		task_management.visible = true
	if event_name == "loop_reset_special":
		Global.day = 3
		print("loop_reset")
		Global.reset_loop()
		get_tree().change_scene_to_file("res://scenes/loop_reset.tscn")
	if event_name == "day_4":
		Global.day = 4
		print("loop_reset")
		Global.reset_loop()
		get_tree().change_scene_to_file("res://scenes/loop_reset.tscn")
	if event_name == "end_game":
		Global.day = 1
		Global.reset_loop()
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	if (event_name == "audio_stop"):
		audio_bg.stop_audio()
	if (event_name == "audio_start"):
		audio_bg.start_audio()
func _on_burnout_filled():
	Dialogic.start("day_2_burnout")
