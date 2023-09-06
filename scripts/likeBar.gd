extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = String($Likeness.value)

func changeBar(num, murderBool):
	if ($Likeness.value <=0):
		if (num >0 or murderBool):
			$Likeness.value += num
			 
	elif (($Likeness.value + num) < 0 and not murderBool):
		$Likeness.value = 0
	else:
		$Likeness.value += num
	
	$Label.text = String($Likeness.value)

	
func checkMurder():
	#looks at the choice made and if its murder returns true
	#if its not it checks murder count value and if its over 0 returns true
	#else return false
	pass
	
func returnValue():
	return $Likeness.value
