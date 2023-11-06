extends Control

func _ready():
	$Label.text = "WEREWOLF: " + String(GlobalOne.score)
	
func _on_coin_collected():
	_ready()
