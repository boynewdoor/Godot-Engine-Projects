extends Node2D

func _on_Switch_body_entered(_body):
	if $Switch/AnimatedSprite.frame == 0:
		$Switch/AnimatedSprite.frame = 1
		$Door/AnimationPlayer.play("SlideUp")
		$Switch/AudioStreamPlayer.play()

