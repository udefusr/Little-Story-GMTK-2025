extends Node

var day := 1
var artist_trust := 0
var musician_trust := 0
var programmer_trust := 0
var loops := 0
var interactions_done := 0

signal feedback_given(name: String, n : int)

func reset_loop():
	print("LOOP RESET")
	artist_trust = 0
	musician_trust = 0
	programmer_trust = 0
	interactions_done = 0
	loops+=1

func update_artist(n : int):
	artist_trust+=n
	feedback_given.emit("artist", n)
func update_programmer(n: int):
	programmer_trust +=n
	feedback_given.emit("programmer", n)
	
func update_musician(n: int):
	musician_trust +=n
	feedback_given.emit("musician", n)
	

func update_var_dialogic():
	Dialogic.VAR.from_script.artist = artist_trust
	Dialogic.VAR.from_script.programmer = programmer_trust
	Dialogic.VAR.from_script.musician = musician_trust
	print("PROGRAMMER:" + str(programmer_trust))
	print("ARTIST:" + str(artist_trust))
	print("MUSICIAN:" + str(musician_trust))

func update_global_interaction_count():
	interactions_done+=1
	print("INTERACTION:" + str(interactions_done))
	if (Global.interactions_done >= 3 ):
		print("Doing loop_1_end_check")
		Dialogic.start("loop_1_end_check")
