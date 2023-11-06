extends Node2D

onready var george_score_label :  Label = $George_Label

func _ready():
	george_score_label.text = "George Score: " + str(ScoreGeorge.score)

# When back button is pressed -> perform an action
func _on_Back_pressed():
	ScoreGeorge.score = 0
	$ExitSound.play()
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
