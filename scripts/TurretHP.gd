extends StaticBody

var splosion= preload("../spawns/Splosion.tscn")

var health = 5
var disabled = false

func _ready():
	pass # Replace with function body.

func bullet_hit(damage):
	if disabled == false:
		health -= damage
		
		if health <= 0:
			$"Turret body/Turret_gun".stop()
			disabled = true
			var boom = splosion.instance()
#			self.add_child(boom)
			boom.get_child(0).emitting = true
			boom.get_child(1).emitting = true

