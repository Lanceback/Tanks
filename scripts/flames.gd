extends Area

var hit_something = false
var timer = 0

func _ready():
# warning-ignore:return_value_discarded
	connect("body_entered", self, "_bullet_body_entered")
	get_child(1).emitting = true

func _physics_process(delta):
	
	transform.origin += Vector3(-35,0,0) * delta
	
	timer += delta
	if timer >= 0.4:
		queue_free()

func _bullet_body_entered(body):
	if hit_something == false:
		if body.has_method("bullet_hit"):
			body.bullet_hit(0.2)
	hit_something = true
	queue_free()
