extends KinematicBody2D

var speed = 200
onready var animation = $Sprite
var entry_time = -1

func _physics_process(_delta):
	var velocity = Vector2()
	
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
	#velocity = velocity.normalized() * speed
	#velocity = move_and_slide(velocity)
	velocity = move_and_slide(velocity.normalized() * speed)
	
	if velocity.length() > 0:
		animation.play()
	else:
		animation.stop()

func _on_Player1_screen_entered():
	entry_time = OS.get_system_time_msecs()
		
func _on_Player1_screen_exited():
	# Get the current time when the player exits
	var exit_time = OS.get_system_time_msecs()
	
	# Calculate the time spent inside the area
	var time_inside = exit_time - entry_time
	
	# Check if it's the first player or if this player entered earlier than the current winner
	if GlobalVariables.winning_time == -1 or time_inside < GlobalVariables.winning_time:
		GlobalVariables.winning_time = time_inside
		GlobalVariables.winning_player = "Werewolf"
	
	# Show the winning message and change the scene
	var winning_message = preload("res://Scenes/WinningMessage.tscn").instance()
	get_tree().root.add_child(winning_message)
	winning_message.get_node("Label").text = GlobalVariables.winning_player + " won!"
	get_tree().change_scene("res://Scenes/Level2.tscn")
