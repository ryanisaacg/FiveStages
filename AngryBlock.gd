
extends Area2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	connect("body_enter", self, "do_the_stuff")


#Actually do the stuff
func do_the_stuff(body):
	if body.has_method("returnToSpot"):
		body.returnToSpot();