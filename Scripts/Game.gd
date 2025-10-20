extends Node2D

@onready var d = preload("res://Scenes/data_interprtuer.tscn")
var current_card: Array

func make_new_Buttons(names):
	var index = 0
	for i in get_children():
		if i is Button:
			i.text = names[index][1]
			i.set_meta("Correct", names[index][0])
			index += 1
		if i is CenterContainer:
			current_card = names[randi_range(0,4)]
			i.get_child(0).text = current_card[0]

func _ready():
	var Data = d.instantiate()
	var arr = Data.make_list()
	for i in range(5):
		var button1 = Button.new()
		button1.text = arr[i][1]
		button1.set_meta("Correct", arr[i][0])
		button1.position = Vector2(i*200 + 125, 500)
		button1.size = Vector2(100,100)
		button1.pressed.connect(_button_pressed.bind(button1))
		add_child(button1)
	current_card = arr[randi_range(0,4)]
	$CenterContainer/Label.text = current_card[0]
	$CenterContainer/Label.set("theme_override_font_sizes/font_size",48)

func _button_pressed(button):
	var Data = d.instantiate()
	if (button.get_meta("Correct") == $CenterContainer/Label.text):
		$CenterContainer/Label.text = "Correct"
	else: $CenterContainer/Label.text = "Sorry, incorrect. The correct answer was " + current_card[1]
	await get_tree().create_timer(1).timeout
	make_new_Buttons(Data.make_list())
