extends Node2D

# When restart button is pressed -> perform an action
func _on_Restart_pressed():
	ScoreGeorge.score = 0
	$RestartSound.play()
	get_tree().change_scene("res://Scenes/Singleplayer.tscn")

# When exit button is pressed -> perform an action
func _on_Exit_pressed():
	ScoreGeorge.score = 0
	$ExitSound.play()
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
