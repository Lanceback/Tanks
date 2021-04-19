extends Button

func _pressed():
# warning-ignore:return_value_discarded
	get_tree().paused = false
	get_tree().change_scene("res://Menu.tscn")
