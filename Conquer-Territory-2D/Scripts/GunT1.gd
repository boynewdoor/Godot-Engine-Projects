extends Node2D

export var bullet_speed = 1000
var bullet = preload("res://Scenes/Bullet.tscn")
var player_detection_range = 200
var fire_rate = 0.5  # Adjust this value to control the firing rate in seconds

var shoot_timer = Timer.new()

func _ready():
	# Add the timer to the current node and connect its timeout signal
	add_child(shoot_timer)
	shoot_timer.connect("timeout", self, "_on_shoot_timer_timeout")
	# Start the timer with the specified fire rate (in seconds)
	shoot_timer.start(fire_rate)

func _on_shoot_timer_timeout():
	# This function will be called each time the timer times out
	var bullet_instance = bullet.instance()
	bullet_instance.position = $Turret/Muzzle.get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
	get_tree().get_root().add_child(bullet_instance)
