extends Control

func _ready():
	var playButton = $PlayGame
	var exitButton = $ExitGame
	playButton.connect("pressed", self, "_on_PlayButton_pressed")
	exitButton.connect("pressed", self, "_on_ExitButton_pressed")
	
func _on_PlayButton_pressed():
	# Change to the game scene
	get_tree().change_scene("res://Scenes/Level1.tscn")

func _on_ExitGame_pressed():
	#Quit the game
	get_tree().quit()
