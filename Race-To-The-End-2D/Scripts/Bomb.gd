extends Area2D

signal bomb_explosion

func _on_Bomb_body_entered(body):
	if body.name == "Player":
		Global.score -= 1
		emit_signal("bomb_explosion")
		$BombExplosion.play()
		$Timer.start()
	elif body.name == "Player1":
		GlobalOne.score -= 1
		emit_signal("bomb_explosion")
		$BombExplosion.play()	
		$Timer.start()
	elif body.name == "Player2":
		GlobalTwo.score -= 1		
		emit_signal("bomb_explosion")
		$BombExplosion.play()
		$Timer.start()
	elif body.name == "Player3":
		GlobalThree.score -= 1
		emit_signal("bomb_explosion")
		$BombExplosion.play()
		$Timer.start()
	else:
		pass

func _on_Timer_timeout():
	queue_free()
