extends Node

export(String) var dialogueName = ""

func _ready():
	var new_dialog = Dialogic.start(dialogueName)
	add_child(new_dialog)
	new_dialog.connect("timeline_end", self, "quit")


	
func quit(timeline_name):
	get_tree().quit()
