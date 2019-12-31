extends HBoxContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal change_file(File_Name)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_File1_pressed():
	set_active_button($File1)
	emit_signal("change_file", 1)

func _on_File2_pressed():
	set_active_button($File2)
	emit_signal("change_file", 2)

func _on_File3_pressed():
	set_active_button($File3)
	emit_signal("change_file", 3)

func set_active_button(button):
	$File1.set_disabled(false)
	$File2.set_disabled(false)
	$File3.set_disabled(false)
	
	button.set_disabled(true)
