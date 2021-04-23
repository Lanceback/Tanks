extends KinematicBody

var splosion= preload("res://spawns/Splosion.tscn")


export var speed = 6
export var rot_speed = 1.2

var velocity = Vector3.ZERO
var health = 32
var disabled = false

func _physics_process(delta):
	if disabled == false:
#		rotate_y(rot_speed * delta)
#		rotate_y(-rot_speed * delta)
#		velocity += -transform.basis.x * speed
#		velocity += transform.basis.x * speed
		velocity = move_and_slide(velocity, Vector3.UP)

func bullet_hit(damage):
	if disabled == false:
		health -= damage
		
		if health <= 0:
			disabled = true
			var boom = splosion.instance()
			self.add_child(boom)
			boom.get_child(0).emitting = true
			boom.get_child(1).emitting = true
			$Cannon.stop()
