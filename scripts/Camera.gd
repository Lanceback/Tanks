extends Camera

var victory = null
var target = null

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func green():
	victory = "green"
	target = $"../Green_tank"
	$reset_instruct.visible = true

func yellow():
	victory = "yellow"
	target = $"../Yellow_tank"
	$reset_instruct.visible = true

func _unhandled_key_input(_event):
	if Input.is_action_just_pressed("secret") and victory != null:
# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("Pause"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().paused = true
		$Pause.show()

func _process(_delta):
	if target != null:
		transform.origin.x = target.transform.origin.x
		transform.origin.z = target.transform.origin.z - 20
		transform.origin.y = target.transform.origin.y + 20
