extends Control

func _ready():
	var singlePlayerButton = $SinglePlayer
	var multiplayerButton = $Multiplayer
	var exitButton = $ExitGame

	singlePlayerButton.connect("pressed", self, "_on_SinglePlayer_pressed")
	multiplayerButton.connect("pressed", self, "_on_Multiplayer_pressed")
	exitButton.connect("pressed", self, "_on_ExitButton_pressed")
	
# When singleplayer mode button is pressed -> perform an action
func _on_SinglePlayer_pressed():
	$PlaySound.play()
	get_tree().change_scene("res://Scenes/Singleplayer.tscn")

# When multiplayer mode button is pressed -> perform an action
func _on_Multiplayer_pressed():
	$PlaySound.play()
	get_tree().change_scene("res://Scenes/LocalMultiplayer.tscn")

# When exit button is pressed -> perform an action
func _on_ExitButton_pressed():
	#Quit the game
	$ExitSound.play()
	get_tree().quit()
