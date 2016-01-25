
extends Area2D

var jumps = 0
const MAX_JUMPS = 10
var parent;
func _ready():
	# Initialization here
	parent = get_node("..")

func jump():
	if jumps < MAX_JUMPS:
		var pos = parent.get_pos()
		if jumps % 2 == 0:
			pos.y -= 256
		elif jumps in [3, 7]:
			pos.x += 900
		else:
			pos.x -= 900
		parent.set_pos(pos)
		jumps += 1
	else:
		print("ADVANCE")
