
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	connect("body_enter", self, "stop_moving")
	connect("body_exit", self, "start_moving")

func stop_moving(object):
	if object.get_name() == "Player":
		object.canJump = false
		object.canMoveRight = false
		object.canMoveLeft = false

func start_moving(object):
	if object.get_name() == "Player":
		object.canJump = true
		object.canMoveRight = true
		object.canMoveLeft = true


