extends Area2D

signal coin_collected

func _on_Coin_body_entered(body):
	if body.name == "Player":
		Global.score += 1
		emit_signal("coin_collected")
		$CoinCollected.play()
	elif body.name == "Player1":
		GlobalOne.score += 1
		emit_signal("coin_collected")
		$CoinCollected.play()
	elif body.name == "Player2":
		GlobalTwo.score += 1
		emit_signal("coin_collected")
		$CoinCollected.play()
	elif body.name == "Player3":
		GlobalThree.score += 1
		emit_signal("coin_collected")
		$CoinCollected.play()
	else:
		pass

func _on_CoinCollected_finished():
	queue_free()
