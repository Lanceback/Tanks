extends MeshInstance

var Bullet = preload("../spawns/Bullet.tscn")

onready var target = get_node("../../../Green_tank")
onready var slurp = get_node("../lerp_gun")

var timer = 0
var mode = "search"

func swivel(pos):
	self.rotate_y(pos)
	if $"popgun/aim".get_collider() == target:
		mode = "attack"

func attack(delta):
	timer += delta
	transform = transform.interpolate_with(slurp.transform, delta * 1.2)

	if timer > 5:
		mode = "search"

	if timer > 0.2:

		if $"popgun/aim".get_collider() == target:
			var pew = Bullet.instance()
			owner.add_child(pew)
			pew.transform = $popgun.global_transform
			timer = 0
		

func stop():
	mode = "dead"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if mode == "search":
		swivel(delta)
	elif mode == "attack":
		attack(delta)
	else:
		pass
