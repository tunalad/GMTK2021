extends Label

var ms = 1
var pissoff = false

func _process(delta):
	if !pissoff:
		if ms < 0:
			#set_text("[DEBUG]: TIME OUT BUCKO! PANTS OFF AND DON'T GET HARD")
			get_tree().change_scene("res://Scenes/GameOver.tscn")
			pissoff = true
		else:
			set_text("Timer: " + str(ms))
	else:
		$ms.stop()
		pass

func _on_ms_timeout():
	ms -= 1
