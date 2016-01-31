
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	for child in get_children():
		if child.has_method("set_texture"):
			child.set_texture(load("res://art/arrows_down.png"))


