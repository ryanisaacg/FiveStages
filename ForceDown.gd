
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	connect("body_enter", self, "force_down")
	connect("body_exit", self, "stop_forcing")
	
func force_down(object):
	if object.get_name() == "Player":
		var velocity = object.velocity;
		if velocity.y < 0:
			velocity.y = -velocity.y;
		object.velocity = velocity;
		object.canJump = false

func stop_forcing(object):
	if object.get_name() == "Player":
		object.canJump = true

