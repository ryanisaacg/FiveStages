extends KinematicBody2D

const GRAVITY = 1000.0
const WALK_SPEED = 300

var velocity = Vector2()
var jump_previous = false
var canMoveRight = true
var canMoveLeft = true
var canJump = true

func _fixed_process(delta):
	velocity.y += delta * GRAVITY
	if canMoveLeft and Input.is_action_pressed("ui_left"):
		velocity.x = - WALK_SPEED
		get_node("AnimatedSprite").set_flip_h(true);
	elif canMoveRight and Input.is_action_pressed("ui_right"):
		velocity.x =   WALK_SPEED
		get_node("AnimatedSprite").set_flip_h(false);
	else:
		velocity.x = 0
	if canJump and Input.is_action_pressed("ui_accept"):
		if not jump_previous: 
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

