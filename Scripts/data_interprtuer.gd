class_name DataInterprtur extends Node2D
func get_data(file_location: String):
	var file = FileAccess.open(file_location, FileAccess.READ)
	var content =file.get_as_text()
	return content

func make_list(file):
	var data = get_data(file)
	var data_list = data.split("\n")
	var complete_data = []
	for i in data_list:
		complete_data.append(i.split("\t"))
	complete_data.remove_at(0)
	var new_list = []
	var top = []
	while len(new_list) < 5:
		var x = complete_data.pick_random()
		if x[1] not in top:
			new_list.append(x)
		top.append(x[1])
	return new_list
