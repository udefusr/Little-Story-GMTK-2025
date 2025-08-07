extends Label

var npc_name : String
var feedback :  String

func _ready() -> void:
	text = npc_name + " " + feedback
	
func updateInfo(name : String, value : int):
	npc_name = name
	if (value == -1):
		feedback = "angry"
	elif  (value == 0):
		feedback = "neutral"
	elif  (value == 1):
		feedback = "happy"
		
	text = npc_name + " " + feedback
func deleteMe():
	queue_free()
