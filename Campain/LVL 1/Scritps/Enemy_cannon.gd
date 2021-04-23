extends Position3D

var Bullet = preload("res://spawns/Bullet.tscn")
var fire = preload("res://spawns/flames.tscn")

var Ammo = 50
var Flames = 400

var cooldown = 0

onready var target = get_node("../../Green_tank")

func stop():
	Ammo = 0
	Flames = 0
	cooldown = -1

func reload():
	Ammo = 50
	Flames = 400

func Input():
	if cooldown > 0:
		if $"aim".get_collider() == target and Ammo > 0 and cooldown > 1:
#			$smoke.emitting = true
			Ammo -= 1
			cooldown = 0
#			get_node("y_ammo").text = str(Ammo)
			var pew = Bullet.instance()
			owner.add_child(pew)
			pew.transform = self.global_transform
#			$smoke.emitting = false
			
#		if Input.is_action_pressed("player2 secondary"):
#			if Flames > 0:
#				Flames -= 1
#				get_node("flame").text = str(Flames)
#				$flames.emitting = true
#				var thing = fire.instance()
#				owner.add_child(thing)
#				thing.transform = $"../Yellow_cannon".global_transform

#
#

func _process(delta):
	cooldown += delta
	Input()
