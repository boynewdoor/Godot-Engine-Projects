extends Area2D

onready var x = preload("res://Assets/x.png")
onready var o = preload("res://Assets/o.png")

var selected = false
export var pos = -1

func _ready():
	$mouse_over.hide()


func _on_POS_mouse_entered():
	if(!selected and !Game.win):
		$mouse_over.show()


func _on_POS_mouse_exited():
	$mouse_over.hide()

func play_x():
	if(!selected and !Game.win):
		$x_o.set_texture(x)
		$mouse_over.hide()
		selected = true
		Game.data_store[pos] = "x"
		Game.check_win(pos, "x")

func play_o(): 
	if(!selected and !Game.win):
		$x_o.set_texture(o)
		$mouse_over.hide()
		selected = true
		Game.data_store[pos] = "o"
		Game.check_win(pos, "o")
		


func _on_POS_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton and event.pressed):
		if (!selected and !Game.win): #Check if the cell is not already selected and the game is not won
			if(event.button_index == BUTTON_LEFT):
				if(Game.current_player == "x"): # Check whose turn it is
					play_x()
				else:
					play_o()
				Game.toggle_player_turn() #Switch to the other player
