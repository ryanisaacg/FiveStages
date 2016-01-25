
extends Area2D

var jumps = 0
var jump_cooldown = false
var timer;
const MAX_JUMPS = 4
var parent;

func _ready():
	# Initialization here
	parent = get_node("..")
	timer = Timer.new()
	add_child(timer)
	timer.set_wait_time(0.5)
	timer.connect("timeout",self,"clear_cooldown")
	
func clear_cooldown():
	jump_cooldown = false
	print("CLEAR")
	timer.stop()
	
func jump():
	if jump_cooldown:
		return null;
	if jumps < MAX_JUMPS:
		var pos = parent.get_pos()
		if jumps % 2 == 0:
			pos.x -= 900
			parent.set_flip_h(true);
		else:
			pos.x += 900
			parent.set_flip_h(false);
		parent.set_pos(pos)
		jumps += 1
		jump_cooldown = true
		timer.start()
	else:
		get_node("/root").get_child(0).get_node("Denial").clear()
