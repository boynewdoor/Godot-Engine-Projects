extends Node2D

onready var george_score_label :  Label = $George_Label
onready var werewolf_score_label : Label = $Werewolf_Label
onready var baldric_score_label : Label = $Baldric_Label
onready var golem_score_label : Label = $Golem_Label
onready var winner_label : Label = $Winner

func _ready():
	george_score_label.text = "George Score: " + str(ScoreGeorge.score)
	werewolf_score_label.text = "Werewolf Score: " + str(ScoreWerewolf.score)
	baldric_score_label.text = "Baldric Score: " + str(ScoreBaldric.score)
	golem_score_label.text = "Golem Score: " + str(ScoreGolem.score)
	var hasWinner = false
	
	# ScoreBoard winner condition
	if (ScoreGeorge.score > ScoreWerewolf.score) and (ScoreGeorge.score > ScoreBaldric.score) and (ScoreGeorge.score > ScoreGolem.score) :
		winner_label.text = "The winner is George with " + str(ScoreGeorge.score) + " points!"
		hasWinner = true
	elif (ScoreWerewolf.score > ScoreGeorge.score) and (ScoreWerewolf.score > ScoreBaldric.score) and (ScoreWerewolf.score > ScoreGolem.score) :
		winner_label.text = "The winner is Werewolf with " + str(ScoreWerewolf.score) + " points!"
		hasWinner = true
	elif (ScoreBaldric.score > ScoreGeorge.score) and (ScoreBaldric.score > ScoreWerewolf.score) and (ScoreBaldric.score > ScoreGolem.score) :
		winner_label.text = "The winner is Baldric with " + str(ScoreBaldric.score) + " points!"
		hasWinner = true
	elif (ScoreGolem.score > ScoreGeorge.score) and (ScoreGolem.score > ScoreWerewolf.score) and (ScoreGolem.score > ScoreBaldric.score) :
		winner_label.text = "The winner is Golem with " + str(ScoreGolem.score) + " points!"
		hasWinner = true
		
	# ScoreBoard if there are ties
	if not hasWinner:
		if (ScoreGeorge.score == ScoreWerewolf.score):
			winner_label.text = "George and Werewolf tied with " + str(ScoreGeorge.score) + " points!"
		elif (ScoreGeorge.score == ScoreBaldric.score):
			winner_label.text = "George and Baldric tied with " + str(ScoreGeorge.score) + " points!"
		elif (ScoreGeorge.score == ScoreGolem.score):
			winner_label.text = "George and Golem tied with " + str(ScoreGeorge.score) + " points!"
		elif (ScoreWerewolf.score == ScoreBaldric.score):
			winner_label.text = "Werewolf and Baldric tied with " + str(ScoreWerewolf.score) + " points!"
		elif (ScoreWerewolf.score == ScoreGolem.score):
			winner_label.text = "Werewolf and Golem tied with " + str(ScoreWerewolf.score) + " points!"
		elif (ScoreBaldric.score == ScoreGolem.score):
			winner_label.text = "Baldric and Golem tied with " + str(ScoreBaldric.score) + " points!"

# When back button is pressed -> perform an action
func _on_Back_pressed():
	ScoreGeorge.score = 0
	ScoreWerewolf.score = 0
	ScoreBaldric.score = 0
	ScoreGolem.score = 0
	$ExitSound.play()
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
