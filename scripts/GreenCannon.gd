extends Position3D

var Bullet = preload("../spawns/Bullet.tscn")
var Missile = preload("../spawns/Missile.tscn")

var Ammo = 50
var Missiles = 5 

var cooldown = 0

func _ready():
	get_node("g_ammo").text = str(Ammo)
	get_node("missiles").text = str(Missiles)
	
func stop():
	Ammo = 0
	Missiles = 0
	cooldown = -5

func reload():
	Ammo = 50
	Missiles = 5
	get_node("g_ammo").text = str(Ammo)
	get_node("missiles").text = str(Missiles)



func _process(delta):
	
	if Ammo <= 0 and Missiles <= 0:
		$"../../Floor".messege("g")
	
	if cooldown < 5 and cooldown > -1:
		cooldown += delta
		
	if cooldown > -1:
		if Input.is_action_just_pressed("player1 fire") and Ammo > 0:
			get_node("smoke").emitting = true
			Ammo -= 1
			cooldown = 0
			var pew = Bullet.instance()
			owner.add_child(pew)
			pew.transform = $"../Cannon".global_transform
			get_node("g_ammo").text = str(Ammo)
			get_node("smoke").emitting = false
			
		if Input.is_action_pressed("player1 secondary") and Missiles > 0 and cooldown > 0.5:
			Missiles -= 1
			cooldown = 0
			var thing = Missile.instance()
			owner.add_child(thing)
			thing.transform = $"../Cannon".global_transform
			get_node("missiles").text = str(Missiles)
