
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	connect("body_enter", self, "start_forcing")
	connect("body_exit", self, "stop_forcing")

func start_forcing(object):
	if object.get_name() == "Player":
		object.canMoveRight = false
		
func stop_forcing(object):
	if object.get_name() == "Player":
		object.canMoveRight = true