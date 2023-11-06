extends Node2D

signal tile_stepped

var george_stepped_tile : int = 1
var werewolf_stepped_tile : int = 2
var baldric_stepped_tile : int = 4
var golem_stepped_tile : int = 5
var fire_tile : int = 6
onready var george = get_node("George")
onready var werewolf = get_node("Werewolf")
onready var baldric = get_node("Baldric")
onready var golem = get_node("Golem")
onready var turret1 = get_node("GunT1")
onready var turret2 = get_node("GunT2")
onready var turret3 = get_node("GunT3")
onready var turret4 = get_node("GunT4")
onready var turret5 = get_node("GunT5")
onready var health_bar_george = $George/HealthBar
onready var health_bar_werewolf = $Werewolf/HealthBar
onready var health_bar_baldric = $Baldric/HealthBar
onready var health_bar_golem = $Golem/HealthBar
var initial_position_george : Vector2 = Vector2()
var initial_position_werewolf : Vector2 = Vector2()
var initial_position_baldric : Vector2 = Vector2()
var initial_position_golem : Vector2 = Vector2()
var has_player_moved : bool = false
var countdown_timer: Timer
var countdown_label: Label
var total_time_seconds: int = 90
var remaining_time_on_pause: float = 0
var active_player : int = 1 # 1 for George, 2 for Werewolf, 3 for Baldric, 4 for Golem
var bullet = preload("res://Scenes/Bullet.tscn")

func _ready():
	countdown_timer = $Timer
	countdown_label = $Label
	countdown_timer.wait_time = total_time_seconds
	countdown_timer.start()
	remaining_time_on_pause = total_time_seconds
	initial_position_george = george.position
	initial_position_werewolf = werewolf.position
	initial_position_baldric = baldric.position
	initial_position_golem = golem.position
	has_player_moved = true

func _physics_process(_delta):
	
	var george_position = george.global_position
	var george_local_position = $TileMap.world_to_map(george_position)
	var werewolf_position = werewolf.global_position
	var werewolf_local_position = $TileMap.world_to_map(werewolf_position)
	var baldric_position = baldric.global_position
	var baldric_local_position = $TileMap.world_to_map(baldric_position)
	var golem_position = golem.global_position
	var golem_local_position = $TileMap.world_to_map(golem_position)
	move_turret()

	# GEORGE
	if george.position != initial_position_george and is_valid_tilemap_coord(george_local_position):
		var cell_value = $TileMap.get_cell(george_local_position.x, george_local_position.y)
		if cell_value != george_stepped_tile:
			if cell_value == werewolf_stepped_tile:
				ScoreWerewolf.score -= 1
			elif cell_value == baldric_stepped_tile:
				ScoreBaldric.score -= 1
			elif cell_value == golem_stepped_tile:
				ScoreGolem.score -= 1
			$TileMap.set_cell(george_local_position.x, george_local_position.y, george_stepped_tile)
			if cell_value == fire_tile:
				health_bar_george.reduce_health(10)
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
		
	# WEREWOLF
	if werewolf.position != initial_position_werewolf and is_valid_tilemap_coord(werewolf_local_position):
		var cell_value = $TileMap.get_cell(werewolf_local_position.x, werewolf_local_position.y)
		if cell_value != werewolf_stepped_tile:
			if cell_value == george_stepped_tile:
				ScoreGeorge.score -= 1
			elif cell_value == baldric_stepped_tile:
				ScoreBaldric.score -= 1
			elif cell_value == golem_stepped_tile:
				ScoreGolem.score -= 1
			$TileMap.set_cell(werewolf_local_position.x, werewolf_local_position.y, werewolf_stepped_tile)
			if cell_value == fire_tile:
				health_bar_werewolf.reduce_health(10)
				$Fire_Stepped.play()
				$StopFireStep.start()
			else: 
				ScoreWerewolf.score += 1
				$Tile_Conquered.play()
				$StopTileConquered.start()
			emit_signal("tile_stepped")
		has_player_moved = true
	elif not is_valid_tilemap_coord(werewolf_local_position):
		has_player_moved = false
		
	# BALDRIC
	if baldric.position != initial_position_baldric and is_valid_tilemap_coord(baldric_local_position):
		var cell_value = $TileMap.get_cell(baldric_local_position.x, baldric_local_position.y)
		if cell_value != baldric_stepped_tile:
			if cell_value == george_stepped_tile:
				ScoreGeorge.score -= 1
			elif cell_value == werewolf_stepped_tile:
				ScoreWerewolf.score -= 1
			elif cell_value == golem_stepped_tile:
				ScoreGolem.score -= 1
			$TileMap.set_cell(baldric_local_position.x, baldric_local_position.y, baldric_stepped_tile)
			if cell_value == fire_tile:
				health_bar_baldric.reduce_health(10)
				$Fire_Stepped.play()
				$StopFireStep.start()
			else: 
				ScoreBaldric.score += 1
				$Tile_Conquered.play()
				$StopTileConquered.start()
			emit_signal("tile_stepped")
		has_player_moved = true
	elif not is_valid_tilemap_coord(baldric_local_position):
		has_player_moved = false
		
	# GOLEM
	if golem.position != initial_position_golem and is_valid_tilemap_coord(golem_local_position):
		var cell_value = $TileMap.get_cell(golem_local_position.x, golem_local_position.y)
		if cell_value != golem_stepped_tile:
			if cell_value == george_stepped_tile:
				ScoreGeorge.score -= 1
			elif cell_value == werewolf_stepped_tile:
				ScoreWerewolf.score -= 1
			elif cell_value == baldric_stepped_tile:
				ScoreBaldric.score -= 1
			$TileMap.set_cell(golem_local_position.x, golem_local_position.y, golem_stepped_tile)
			if cell_value == fire_tile:
				health_bar_golem.reduce_health(10)
				$Fire_Stepped.play()
				$StopFireStep.start()
			else:	
				ScoreGolem.score += 1
				$Tile_Conquered.play()
				$StopTileConquered.start()
			emit_signal("tile_stepped")
		has_player_moved = true
	elif not is_valid_tilemap_coord(golem_local_position):
		has_player_moved = false
		
	var remaining_seconds = int(countdown_timer.time_left)
	var hours = int(remaining_seconds / 3600)
	var minutes = int(remaining_seconds % 3600 / 60)
	var seconds = int(remaining_seconds % 60)
	
	var time_string = "%02d:%02d:%02d" % [hours, minutes, seconds]
	
	countdown_label.text = "Time: " + time_string
				
func is_valid_tilemap_coord(coord):
	return coord.x >= 0 and coord.x < $TileMap.get_used_rect().size.x and coord.y >= 0 and coord.y < $TileMap.get_used_rect().size.y
	
func _on_Timer_timeout():
	countdown_timer.stop()
	ScoreGeorge.score = ScoreGeorge.score
	ScoreWerewolf.score = ScoreWerewolf.score
	ScoreBaldric.score = ScoreBaldric.score
	ScoreGolem.score = ScoreGolem.score
	get_tree().change_scene("res://Scenes/MultiplayerWinningScene.tscn")

func _on_Restart_pressed():
	ScoreGeorge.score = 0
	ScoreWerewolf.score = 0
	ScoreBaldric.score = 0
	ScoreGolem.score = 0
	$RestartSound.play()
	get_tree().change_scene("res://Scenes/LocalMultiplayer.tscn")

func _on_Exit_pressed():
	ScoreGeorge.score = 0
	ScoreWerewolf.score = 0
	ScoreBaldric.score = 0
	ScoreGolem.score = 0
	$ExitSound.play()
	get_tree().change_scene("res://Scenes/MainMenu.tscn")

func _on_StopTileConquered_timeout():
	$Tile_Conquered.stop()

func _on_StopFireStep_timeout():
	$Fire_Stepped.stop()
	
func move_turret():
	#follow george
	if george:
		var target_position1 = george.global_position - global_position
		turret1.look_at(target_position1)
		
	#follow werewolf
	if werewolf:
		var target_position2 = werewolf.global_position - global_position
		turret2.look_at(target_position2)
		
	# follow baldric
	if baldric:
		var target_position3 = baldric.global_position - global_position
		turret3.look_at(target_position3)
		
	# follow golem
	if golem:
		var target_position4 = golem.global_position - global_position
		turret4.look_at(target_position4)
