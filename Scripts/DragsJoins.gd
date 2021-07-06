extends Node2D

var draggable = false
var connected = false

func _ready():
	var randX = rand_range(500,900)
	var randY = rand_range(15,500)
	set_position(Vector2(randX, randY))

func _process(delta):
	if draggable and !connected:
		set_position(get_viewport().get_mouse_position())

func _on_Drag_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			$"../Pickup".play()
			draggable = true
		else:
			draggable = false

func _on_Joint_area_entered(area):
	var myName = get_name()
	if str(get_name() + 'Joint') in area.get_name():
		$"../Click".play()
		#get position of the joint
		var jointPos = get_node("../Torso/"+ myName +"Joint").get_position() + get_node("../Torso").get_position() - $Joint.get_position()
		set_position(jointPos)
		#clears joint sprites
		$Joint.hide()
		get_node("../Torso/" + myName +"Joint").hide()
		#makes it undraggable
		draggable = false
		connected = true
		
		Global.partsCount += 1
