extends Node2D

func _ready() -> void:
	$Button.pressed.connect(get_tree().change_scene_to_file.bind("res://Scenes/Game.tscn"))
