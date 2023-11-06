extends Control

func _ready():
	$Label.text = "GEORGE: " + String(Global.score)

func _on_coin_collected():
	_ready()

func _on_bomb_explosion():
	_ready()
