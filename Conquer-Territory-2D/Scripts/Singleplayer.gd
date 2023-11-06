extends Node2D

signal tile_stepped

var george_stepped_tile : int = 1 # Tile that define the conqueror of George
var fire_tile : int = 6 # Title that defines the fire
onready var george = get_node("George")
onready var turret1 = get_node("GunT1")
onready var turret2 = get_node("GunT2")
onready var turret3 = get_node("GunT3")
onready var turret4 = get_node("GunT4")
onready var health_bar = $George/HealthBar
var initial_position_george : Vector2 = Vector2()
var has_player_moved : bool = false
var countdown_timer: Timer
var countdown_label: Label
var total_time_seconds: int = 90
var bullet = preload("res://Scenes/Bullet.tscn")

func _ready():
	countdown_timer = $Timer
	countdown_label = $Label
	countdown_timer.wait_time = total_time_seconds
	countdown_timer.start()
	initial_position_george = george.position
	health_bar = $George/HealthBar
	has_player_moved = true

func _physics_process(_delta):
	var george_position = george.global_position
	var george_local_position = $TileMap.world_to_map(george_position)
	move_turret()

	# GEORGE
	if george.position != initial_position_george and is_valid_tilemap_coord(george_local_position):
		var cell_value = $TileMap.get_cell(george_local_position.x, george_local_position.y)
		if cell_value != george_stepped_tile:
			$TileMap.set_cell(george_local_position.x, george_local_position.y, george_stepped_tile)
			if cell_value == fire_tile:
				health_bar.reduce_health(10)
				$Fire_Stepped.play()
				$StopFireStep.start()
			else:
				ScoreGeorge.score += 1
				$Tile_Conquered.play()
				$StopTileConquered.start()
			emit_signal("tile_stepped")
		has_player_moved = true
	elif not is_valid_tilemap_coord(george_local_position):
		has_player_moved = false
		
	# Timer definition
	var remaining_seconds = int(countdown_timer.time_left)
	var hours = int(remaining_seconds / 3600)
	var minutes = int(remaining_seconds % 3600 / 60)
	var seconds = int(remaining_seconds % 60)
	
	var time_string = "%02d:%02d:%02d" % [hours, minutes, seconds]
	
	countdown_label.text = "Time: " + time_string

func is_valid_tilemap_coord(coord):
	return coord.x >= 0 and coord.x < $TileMap.get_used_rect().size.x and coord.y >= 0 and coord.y < $TileMap.get_used_rect().size.y
	
# When timer runs out of time -> perform an action
func _on_Timer_timeout():
	countdown_timer.stop()
	ScoreGeorge.score = ScoreGeorge.score
	get_tree().change_scene("res://Scenes/SingleplayerWinningScene.tscn")
	
# When back button is pressed -> perform an action
func _on_Restart_pressed():
	ScoreGeorge.score = 0
	$RestartSound.play()
	get_tree().change_scene("res://Scenes/Singleplayer.tscn")

# When exit button is pressed -> perform an action
func _on_Exit_pressed():
	ScoreGeorge.score = 0
	$ExitSound.play()
	get_tree().change_scene("res://Scenes/MainMenu.tscn")

func _on_StopTileConquered_timeout():
	$Tile_Conquered.stop()

func _on_StopFireStep_timeout():
	$Fire_Stepped.stop()

func move_turret():
	if george:
		var target_position = george.global_position - global_position
		turret1.look_at(target_position)
		turret2.look_at(target_position)
		turret3.look_at(target_position)
		turret4.look_at(target_position)
