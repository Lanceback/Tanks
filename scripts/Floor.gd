extends StaticBody

var green_ammo = true
var yellow_ammo = true

var timer = 0

func _ready():
	pass # Replace with function body.

func messege(color):
	if color == "g":
		green_ammo = false
	elif color == "y":
		yellow_ammo = false

func _process(delta):
	if green_ammo == false and yellow_ammo ==false:
		timer += delta
		if timer > 5:
			$"../Yellow_tank/Yellow_cannon".reload()
			$"../Green_tank/Cannon".reload()
			timer = 0
			green_ammo = true
			yellow_ammo = true
			$"../Yellow_tank/Yellow_cannon/y_ammo".text = str(50)
			$"../Yellow_tank/Yellow_cannon/flame".text = str(500)
