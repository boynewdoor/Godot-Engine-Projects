extends Control

func _ready():
	$Label.text = "GEORGE: " + String(ScoreGeorge.score)

func _on_tile_stepped():
	_ready()
