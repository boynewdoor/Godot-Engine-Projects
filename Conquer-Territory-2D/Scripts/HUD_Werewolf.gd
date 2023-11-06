extends Control

func _ready():
	$Label.text = "WEREWOLF: " + String(ScoreWerewolf.score)

func _on_tile_stepped():
	_ready()
