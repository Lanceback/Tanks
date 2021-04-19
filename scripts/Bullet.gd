extends Area

const KILL_TIMER = 5
var timer = 0

var hit_something = false

export var muzzle_velocity = 35
export var g = Vector3.DOWN * 8

var velocity = Vector3(-80,0,0)

func _ready():
# warning-ignore:return_value_discarded
	connect("body_entered", self, "_bullet_body_entered")

func _physics_process(delta):
	velocity += g * delta
	look_at(transform.origin + velocity.normalized(), Vector3.UP)
	transform.origin += velocity * delta
	
	timer += delta
	if timer >= KILL_TIMER:
		queue_free()


func _bullet_body_entered(body):
	if hit_something == false:
		if body.has_method("bullet_hit"):
			body.bullet_hit(1)
	hit_something = true
	queue_free()
