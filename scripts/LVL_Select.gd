extends Button


func _pressed():
#	for now it just goes to the game
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Campain/LVL 1/LVL 1.tscn")
