extends Control

func _ready():
	$Label.text = "GOLEM: " + String(ScoreGolem.score)

func _on_tile_stepped():
	_ready()
