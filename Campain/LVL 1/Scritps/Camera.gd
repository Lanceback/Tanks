extends Camera

var target = "../Green_tank"
func _process(_delta):
	if target:
		transform.origin.x = get_node(target).transform.origin.x + 10
		transform.origin.z = get_node(target).transform.origin.z
		transform.origin.y = get_node(target).transform.origin.y + 40
