extends Node

export(String) var startDialogue = "GameStart"
export(String) var badEndPath = "res://scenes/BadEnd.tscn"
export(String) var goodEnd1Path = "res://scenes/GoodEnd1.tscn"
export(String) var goodEnd2Path = "res://scenes/GoodEnd2.tscn"
export(String) var secretEndPath = "res://scenes/SecretEnd.tscn"

onready var likeBar = $"CanvasLayer/likeBar"
onready var favourability = 50
var murder_count = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	favourability = 50
	
	
	var new_dialog = Dialogic.start(startDialogue)
	add_child(new_dialog)
	#new_dialog.connect("timeline_end", self, "quit")

func quit(timeline_name):
	get_tree().quit()
	
func decideEnd(roroTrue):
	var bool_roro
	if (roroTrue == "false"):
		bool_roro = false
	else:
		bool_roro = true
		
	var newScenePath
	
	if (favourability < 0):
		if (bool_roro):
			newScenePath = secretEndPath
		else:
			newScenePath = goodEnd2Path
	elif (favourability > 40):
		newScenePath = badEndPath
	else:
		newScenePath = goodEnd1Path
			
	
	get_tree().change_scene(newScenePath)
		
		
	
	
	
	

func incoming(timeline_name):
	var custom_pos = Vector2(0,-400)
	var incoming_dialog = Dialogic.start(timeline_name)
	incoming_dialog.set_offset(custom_pos)
	
	add_child(incoming_dialog)
	


func change_favourability(fav_num, murder_option):
	var bool_murder
	if (murder_option == "false"):
		bool_murder = false
	else:
		bool_murder = true
		
	#Update favourability
	fav_num = int(fav_num)
	if (favourability <=0):
		if (fav_num >0 or bool_murder):
			favourability += fav_num
			 
	elif ((favourability + fav_num) < 0 and not bool_murder):
		favourability = 0
	else:
		favourability += fav_num
	
	
	likeBar.changeBar(fav_num, bool_murder)
	print(favourability)
