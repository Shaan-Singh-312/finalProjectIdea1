class_name DataInterprtur extends Node2D

var lst: Array

## Takes String of file path of a JSON file and returns the file data as an array
func read_json(file: String) -> void:
	lst = JSON.parse_string(FileAccess.get_file_as_string(file))

## Precondition: JSON structure must be 
## {
##	"name": "Bulbasaur",
##	"type": [
##	  "Grass",
##	  "Poison"
##	]
##},
## Makes a lsit of items of with diffrent type valuse
func make_lst() -> Array:
		var new_list = []
		var top = []
		while len(new_list) < 5: #Mandate 5 choices
			var lst_rand_item = lst.pick_random()
			if lst_rand_item["type"] not in top: # Check if item already chosen or if there are 2 of the same answer
				var types = ""
				#Turn dictonary into string
				for i in range(len(lst_rand_item["type"])):
					types+=lst_rand_item["type"][i]+"\t"
				
				types = types.substr(0,len(types) -1) #Remove last tab character
				new_list.append([lst_rand_item["name"],types])
				top.append(lst_rand_item["type"]) # Update current answer choice
		return new_list
