extends KinematicBody2D

const GRAVITY = 1000.0
const WALK_SPEED = 300

var velocity = Vector2()
var jump_previous = false

func _fixed_process(delta):
	velocity.y += delta * GRAVITY
	if Input.is_action_pressed("ui_left"):
		velocity.x = - WALK_SPEED
		get_node("AnimatedSprite").set_flip_h(true);
	elif Input.is_action_pressed("ui_right"):
		velocity.x =   WALK_SPEED
		get_node("AnimatedSprite").set_flip_h(false);
	else:
		velocity.x = 0
	if not jump_previous and Input.is_action_pressed("ui_accept"):
		var space = get_world_2d().get_space();
		var space_state = Physics2DServer.space_get_direct_state( space )
		var below = self.get_pos();
		below.y += 50
		var returnval = space_state.intersect_ray(self.get_pos(), below, [self]);
		if returnval.size() != 0:
			velocity.y = -400;
		jump_previous = true;
	else:
		jump_previous = false;
	
	var motion = velocity * delta
	motion = move( motion ) 
	
	if is_colliding():
		var n = get_collision_normal()
		var motion = n.slide( motion ) 
		velocity = n.slide( velocity )
		move( motion )



func _ready():
    set_fixed_process(true)