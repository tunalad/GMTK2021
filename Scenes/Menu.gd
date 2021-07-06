extends Control

func _on_Start_button_down():
	TimerDisplay.ms = 30
	TimerDisplay.pissoff = false
	
	get_tree().change_scene("res://Scenes/Game.tscn")
	TimerDisplay.get_node("ms").start()
	TimerDisplay.show()

func _on_Info_button_down():
	OS.shell_open("https://tunalad.bandcamp.com")
