extends KinematicBody2D

var speed = 50 + randi() % 151;
onready var animation = $Sprite

func _physics_process(_delta):
	var velocity = Vector2()
	
	# Define the Golem movement layout
	if Input.is_action_pressed("move_right_k"):
		velocity.x = 1
		animation.play("right")
	if Input.is_action_pressed("move_left_h"):
		velocity.x = -1
		animation.play("left")
	if Input.is_action_pressed("move_up_u"):
		velocity.y = -1
		animation.play("up")
	if Input.is_action_pressed("move_down_j"):
		velocity.y = 1
		animation.play("down")
	velocity = move_and_slide(velocity.normalized() * speed)
	
	if velocity.length() > 0:
		animation.play()
	else:
		animation.stop()
