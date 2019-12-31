extends TextureButton

const NUM = {
1 : preload("res://Numbers/Number1.png"),
2 : preload("res://Numbers/Number2.png"),
3 : preload("res://Numbers/Number3.png"),
4 : preload("res://Numbers/Number4.png"),
5 : preload("res://Numbers/Number5.png"),
6 : preload("res://Numbers/Number6.png"),
7 : preload("res://Numbers/Number7.png"),
8 : preload("res://Numbers/Number8.png"),
9 : preload("res://Numbers/Number9.png"),
0 : preload("res://Numbers/Number10.png")
}

var a = 9
var b = 9
var numb
var save_dict = {}

func assign_number(number):
	numb = number
	a = int(number/10)
	b = number - a*10
	
	$HBoxContainer/TextureRect.set_texture(NUM[a])
	$HBoxContainer/TextureRect2.set_texture(NUM[b])

func _on_DayButton_toggled(button_pressed):
	update_button(button_pressed)

func update_button(button_pressed):
	if button_pressed == true:
		$HBoxContainer.set_modulate(Color(0,0,0,1))
	else:
		$HBoxContainer.set_modulate(Color(1,1,1,1))

func save():
	save_dict = {
		"filename" : get_filename(),
		"parent" : get_parent().get_path(),
		"object" : self.get_path(),
		"pressed" : is_pressed()
	}
	return save_dict
