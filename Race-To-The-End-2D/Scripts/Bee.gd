extends KinematicBody2D

export var speed = 100
var direction = -1
var velocity = Vector2()
onready var animatedSprite = $AnimatedSprite
#var player_position
#var target_position
#onready var player = get_parent().get_node("Player")

func _physics_process(delta):
	
	if is_on_wall():
		direction = direction * -1
		animatedSprite.flip_h = not animatedSprite.flip_h
	velocity.x = speed * direction
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if velocity.x != 0:
		animatedSprite.play("walk")
	else:
		animatedSprite.stop()
	
	#player_position = player.position
	#target_position = (player_position - position).normalized()
	
	#if position.distance_to(player_position) > 1:
	#	move_and_slide(target_position * speed)
	#	look_at(player_position)
