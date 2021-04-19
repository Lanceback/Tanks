extends RigidBody

export var muzzle_velocity = 35
export var g = Vector3.DOWN * 50

var velocity = Vector3(0,30,0)

var timer = 0


func _physics_process(delta):
	velocity += g * delta
	transform.origin += velocity * delta
	
	timer += delta
	if timer >= 6:
		queue_free()
