extends Node2D

func _ready():
	randomize()
	var picked = randi() % 4
	var robopick = "res://Objects/Robot"+ str(picked) +".tscn"
	var robo = load(robopick)
	var newBot = robo.instance()
	newBot.set_name("Robot" + str(get_child_count()))
	add_child(newBot)

func _process(delta):
	if Global.partsCount == 5:
		Global.partsCount = 0
#	if Global.Head && Global.RArm && Global.LArm && Global.RLeg && Global.LLeg:
#		Global.Head = false
#		Global.RArm = false
#		Global.LArm = false
#		Global.RLeg = false
#		Global.LLeg = false
		
		Global.score += 1
		print("big W, score bumped up:", Global.score)
		
		var t = Timer.new()
		t.set_wait_time(.20)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		
		#I've been screwing around with instances of nodes for some time now so imma just reset the scene xd
		get_tree().reload_current_scene()
	else:
		pass
