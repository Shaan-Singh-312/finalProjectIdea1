class_name DataInterprtur extends Node2D

func read_json(file):
	var json_as_lst = JSON.parse_string(FileAccess.get_file_as_string(file))
	if json_as_lst:
		print(typeof(json_as_lst))
		
	var new_list = []
	var top = []
	while len(new_list) < 5:
		var x = json_as_lst.pick_random()
		if x["type"] not in top:
			var types = ""
			for i in range(len(x["type"])):
				types+=x["type"][i]+"\t"
			types = types.substr(0,len(types) -1)
			new_list.append([x["name"],types])
		top.append(x["type"])
	print(new_list)
	return new_list
