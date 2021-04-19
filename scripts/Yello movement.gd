extends KinematicBody

var splosion= preload("../spawns/Splosion.tscn")

export var speed = 8
export var rot_speed = 1.6

var velocity = Vector3.ZERO

var health = 25

var disabled = false

func _physics_process(delta):
	if health > 0:
		get_input(delta)
		velocity = move_and_slide(velocity, Vector3.UP)
	
	
func get_input(delta):
	var vy = velocity.y
	velocity = Vector3.ZERO
	if Input.is_action_pressed("player2 forward"):
		velocity += -transform.basis.x * speed
	if Input.is_action_pressed("player2 backwards"):
		velocity += transform.basis.x * speed
	if Input.is_action_pressed("player2 right"):
		rotate_y(-rot_speed * delta)
	if Input.is_action_pressed("player2 left"):
		rotate_y(rot_speed * delta)
	velocity.y = vy

func bullet_hit(damage):
	if disabled == false:
		health -= damage
		$"../Camera/y_hp".value = health
		if health < 1:
			$"../Camera".green()
			disabled = true
			var boom = splosion.instance()
			self.add_child(boom)
			boom.get_child(0).fire()
			boom.get_child(1).fire()
			$Yellow_cannon.stop()
