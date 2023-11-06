extends Control

func _ready():
	$Label.text = "BALDRIC:" + String(GlobalTwo.score)
	
func _on_coin_collected():
	_ready()
