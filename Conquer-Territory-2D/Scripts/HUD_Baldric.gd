extends Control

func _ready():
	$Label.text = "BALDRIC: " + String(ScoreBaldric.score)

func _on_tile_stepped():
	_ready()
