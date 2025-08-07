extends Interactable

func on_interact():
	print("Interacted with " + name)
	if (Global.day == 1):
		Dialogic.start("day_1_gather")
	elif (Global.day == 3):
		Dialogic.start("day_3_computer")
