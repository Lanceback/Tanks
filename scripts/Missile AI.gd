extends Area

var hit_something = false
const KILL_TIMER = 4
var timer = 0

onready var splosion= preload("../spawns/Splosion.tscn")

export var g = Vector3.ZERO

var velocity = Vector3(-35,0,0)

var speed = 1

func _ready():
# warning-ignore:return_value_discarded
	connect("body_entered", self, "_Missile_body_entered")

func _physics_process(delta):
#	var to_player = get_node("../../Yellow_tank").translation
#	if to_player.x > self.translation.x:
#		velocity.x += speed
#	if to_player.x < self.translation.x:
#		velocity.x -= speed
#	if to_player.z > self.translation.z:
#		velocity.z += speed
#	if to_player.z < self.translation.z:
#		velocity.z -= speed
	
	transform.origin += velocity * delta
	
	
	timer += delta
	if timer >= KILL_TIMER:
		queue_free()

func _Missile_body_entered(body):
	if hit_something == false:
		if body.has_method("bullet_hit"):
			body.bullet_hit(8)
	hit_something = true
	var boom = splosion.instance()
	boom.get_child(0).fire()
	boom.get_child(1).fire()
	$"../../".add_child(boom)
	boom.transform = self.global_transform
	queue_free()
