extends Control

# The Months and lengths in int and str
const Month = {1 : 31, 2 : 29, 3 : 31, 4 : 30, 5 : 31, 6 : 30, 7 : 31, 8 : 31, 9 : 30, 10 : 31, 11 : 30, 12 : 31}
const MonthStr = {1 : "January", 2 : "February", 3 : "March", 4 : "April", 5 : "May", 6 : "June", 7 : "July", 8 : "August", 9 : "September", 10 : "October", 11 : "November", 12 : "December"}
const FILES = {1 : "user://savegame.save", 2 : "user://savegame2.save", 3 : "user://savegame3.save"}
var current_line = {}
var current_file = 1

const MONTH = preload("res://Month.tscn")

func _ready():
	for i in range(1, 13):
		var m = MONTH.instance()
		m.days = Month[i]
		$MarginContainer/VBoxContainer2/VBoxContainer.add_child(m)
	load_game(current_file)

func load_game(File_Name):
	var save_game = File.new()
	if not save_game.file_exists(FILES[File_Name]):
		return # Error! We don't have a save to load.
	
	save_game.open(FILES[File_Name], File.READ)
	while not save_game.eof_reached():
	
		current_line = parse_json(save_game.get_line())
		if (current_line == null):
			continue
	
		get_node(current_line["object"]).set_pressed(current_line["pressed"])
		get_node(current_line["object"]).update_button(current_line["pressed"])
	save_game.close()

func _on_Exit_pressed():
	save_game(current_file)
	get_tree().quit()

func save_game(File_Name):
	var save_game = File.new()
	save_game.open(FILES[File_Name], File.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for i in save_nodes:
		var node_data = i.call("save");
		save_game.store_line(to_json(node_data))
	save_game.close()

func _on_HBoxContainer_change_file(File_Name):
	save_game(current_file)
	current_file = File_Name
	load_game(File_Name)
