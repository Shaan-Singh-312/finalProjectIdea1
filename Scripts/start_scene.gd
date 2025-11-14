extends Node2D

@onready var pic = preload("res://Sprites/icon.svg")
@onready var main = preload("res://Scenes/Game.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.pressed.connect(self.on_click)
# Called every frame. 'delta' is the elapsed time since the previous frame.

func on_click() -> void:
	get_tree().change_scene_to_file("res://Scenes/tutorial.tscn")
