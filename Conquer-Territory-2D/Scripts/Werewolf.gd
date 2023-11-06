extends KinematicBody2D

var speed = 50 + randi() % 151;
onready var animation = $Sprite

func _physics_process(_delta):
	var velocity = Vector2()
	
	# Define the Werewolf movement layout
	if Input.is_action_pressed("move_right_d"):
		velocity.x = 1
		animation.play("right")
	if Input.is_action_pressed("move_left_a"):
		velocity.x = -1
		animation.play("left")
	if Input.is_action_pressed("move_up_w"):
		velocity.y = -1
		animation.play("up")
	if Input.is_action_pressed("move_down_s"):
		velocity.y = 1
		animation.play("down")
	velocity = move_and_slide(velocity.normalized() * speed)
	
	if velocity.length() > 0:
		animation.play()
	else:
		animation.stop()
