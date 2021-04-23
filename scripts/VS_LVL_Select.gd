extends Button

# eventually this will switch to level selection

func _pressed():
#	for now it just goes to the game
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Battle/Original/World.tscn")
