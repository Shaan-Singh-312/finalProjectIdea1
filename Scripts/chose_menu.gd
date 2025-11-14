extends Node2D

func _ready() -> void:
	$Button.pressed.connect(self.button_pressed.bind("D"))
	$Button2.pressed.connect(self.button_pressed.bind("P"))
	$Button3.pressed.connect(self.button_pressed.bind("M"))
	
func button_pressed(text: String) -> void:
	if text == "D": 
		GlobalData.data_set = "res://Data/Dominion.json"
		print("d")
	if text == "P": 
		GlobalData.data_set = "res://Data/pokedex.json"
	if text == "M": 
		GlobalData.data_set = ""
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")
