extends Button

func _pressed():
#	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().paused = true
	get_parent().hide()
