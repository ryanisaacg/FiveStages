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
	if Input.is_action_pressed("ui_accept"):
		if not jump_previous: 
			#var space = get_world_2d().get_space();
			#var space_state = Physics2DServer.space_get_direct_state( space )
			#var below = self.get_pos();
			#below.y += 20
			#var returnval = space_state.intersect_ray(self.get_pos(), below, [self]);
			#below.x += -abs(velocity.x) / velocity.x * 16;
			#var backwards = space_state.intersect_ray(self.get_pos(), below, [self]);
			#if returnval.size() != 0 or backwards.size() != 0:
			velocity.y = -450;
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

func returnToSpot():
	set_pos(get_node("/root").get_child(0).get_node("AngerResetSpot").get_pos())

#func _on_Area2D_body_enter( body ):
	#if body.get_node("..").get_name() == "ghost":
	#	var area = get_node("/root").get_child(0).get_node("ghost").get_node("Area2D")
	#	area.jump()
	#elif body.get

