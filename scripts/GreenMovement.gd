extends KinematicBody

var splosion= preload("../spawns/Splosion.tscn")


export var speed = 6
export var rot_speed = 1.2

var velocity = Vector3.ZERO
var health = 32
var disabled = false

func _physics_process(delta):
	if disabled == false:
		get_input(delta)
		velocity = move_and_slide(velocity, Vector3.UP)

func get_input(delta):
	if disabled == false:
		var vy = velocity.y
		velocity = Vector3.ZERO
		if Input.is_action_pressed("player1 forward"):
			velocity += -transform.basis.x * speed
		if Input.is_action_pressed("player1 backwards"):
			velocity += transform.basis.x * speed
		if Input.is_action_pressed("player1 right"):
			rotate_y(-rot_speed * delta)
		if Input.is_action_pressed("player1 left"):
			rotate_y(rot_speed * delta)
		velocity.y = vy

func bullet_hit(damage):
	if disabled == false:
		health -= damage
		$"g_hp".value = health
		
		if health <= 0:
			$"../Camera".yellow()
			disabled = true
			var boom = splosion.instance()
			self.add_child(boom)
			boom.get_child(0).emitting = true
			boom.get_child(1).emitting = true
			$Cannon.stop()
