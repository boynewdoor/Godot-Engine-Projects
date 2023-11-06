extends Control

func _ready():
	$Label.text = "GOLEM:" + String(GlobalThree.score)
	
func _on_coin_collected():
	_ready()
