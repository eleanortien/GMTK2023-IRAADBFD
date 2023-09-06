extends TextureButton

export(bool) var isQuit = false
export(String) var newScenePath = "res://scenes/Game.tscn"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", self, "_button_pressed")


func _button_pressed():
	if (not isQuit):
		get_tree().change_scene(newScenePath)
	else:
		get_tree().quit()

