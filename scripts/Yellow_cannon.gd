extends Position3D

var Bullet = preload("../spawns/Bullet.tscn")
var fire = preload("../spawns/flames.tscn")

var Ammo = 50
var Flames = 400

var cooldown = 0

func _ready():
	get_node("y_ammo").text = str(Ammo)
	get_node("flame").text = str(Flames)

func stop():
	Ammo = 0
	Flames = 0
	cooldown = -1

func reload():
	Ammo = 50
	Flames = 400

func Input():
	if cooldown > 0:
		if Input.is_action_just_pressed("player2 fire") and Ammo > 0:
			$smoke.emitting = true
			Ammo -= 1
			cooldown = 0
			get_node("y_ammo").text = str(Ammo)
			var pew = Bullet.instance()
			owner.add_child(pew)
			pew.transform = $"../Yellow_cannon".global_transform
			$smoke.emitting = false
			
		if Input.is_action_pressed("player2 secondary"):
			if Flames > 0:
				Flames -= 1
				get_node("flame").text = str(Flames)
				$flames.emitting = true
				var thing = fire.instance()
				owner.add_child(thing)
				thing.transform = $"../Yellow_cannon".global_transform
			else:
				$flames.emitting = false
		
		if Input.is_action_just_released("player2 secondary"):
			$flames.emitting = false

func _process(delta):
	Input()
	if Ammo <= 0 and Flames <= 0:
		$"../../Floor".messege("y")
	
	if cooldown < 2 and cooldown != -1:
		cooldown += delta
