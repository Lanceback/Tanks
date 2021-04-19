extends StaticBody

#var boom = preload("../spawns/Splosion.tscn")

var health = 15
var movement = false
var velocity = Vector3(0,-1,0)

func bullet_hit(damage):
	health -= damage

	if health <= 0:
#		$dust.emitting = true
		movement = true
	
func _process(delta):
	if movement == true:
#
		transform.origin += velocity * delta
		if transform.origin.y < -3:
#			$dust.emitting = false
			movement = false
			
