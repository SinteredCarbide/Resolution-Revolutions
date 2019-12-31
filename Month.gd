extends HBoxContainer

var Day = preload("res://Button.tscn")
export var days = 1

func _ready():
	for i in range(0, days):
		var d = Day.instance()
		d.assign_number(i+1)
		add_child(d)
