extends Control

func _ready():
	TimerDisplay.hide()
	$Label.set_text("number of robots/toys you pieced together: " + str(Global.score))

func _on_Button_button_down():
	get_tree().change_scene("res://Scenes/Menu.tscn")
