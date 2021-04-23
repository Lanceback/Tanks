extends Position3D

onready var target = get_node("../../../Green_tank")

func _process(delta):
	if target:
		look_at(target.transform.origin, Vector3.UP)
