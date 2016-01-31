extends KinematicBody2D

const GRAVITY = 1000.0
const WALK_SPEED = 300

var velocity = Vector2()
var jump_previous = false
var canMoveRight = true
var canMoveLeft = true
var canJump = true
var flipped = false

func _fixed_process(delta):
	var movePenalty = 1
	var topNodePos = get_node("/root").get_child(0).get_node("DepressionStart").get_pos();
	var botNodePos = get_node("/root").get_child(0).get_node("DepressionEnd").get_pos();
	var pos = get_pos()
	if pos.y >= topNodePos.y and pos.y <= botNodePos.y:
		var distance = pos.x - topNodePos.x;
		var maxDistance = topNodePos.x - botNodePos.x;
		movePenalty = 1 + distance / float(maxDistance)
	velocity.y += delta * GRAVITY
	if canMoveLeft and Input.is_action_pressed("ui_left"):
		velocity.x = - WALK_SPEED * movePenalty
		get_node("AnimatedSprite").set_flip_h(true);
		flipped = true
	elif canMoveRight and Input.is_action_pressed("ui_right"):
		velocity.x =   WALK_SPEED * movePenalty
		get_node("AnimatedSprite").set_flip_h(false);
		flipped = false
	else:
		velocity.x = 0
	if canJump and Input.is_action_pressed("ui_accept"):
		if not jump_previous: 
			velocity.y = -450 * min(movePenalty * 2, 1);
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

