@tool
extends Level

var bg2 = preload("res://icons/bg_kenef2.png")
var bg1 = preload("res://icons/bg_kenef.png")

func _ready() -> void:
	#Globals.can_player_move = false
	#%Background.texture = bg1
	print(%Background.texture)
	#
#func _process(_delta: float) -> void:
	#print(Globals.get_player(1).position)

func set_start(id: int = 2):
	%Background.texture = bg1

func change_background(id: int = 2):
	%Background.texture = bg2 if id == 2 else bg1
