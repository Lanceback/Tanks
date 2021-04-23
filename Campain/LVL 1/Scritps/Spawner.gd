extends Position3D

var timer = 0

var player1 = preload("res://spawns/Green_tank.tscn")

# Called when the node enters the scene tree for the first time.
func spawn(_color):
	var p = player1.instance()
	owner.add_child(p)
	$"../Camera".target = "../Green_tank"

func _process(_delta):
	
	if timer != -1:
		if timer > 5:
			spawn("green")
			timer = -1
		else:
			timer += 1
