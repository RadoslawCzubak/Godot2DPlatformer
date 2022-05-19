extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -350
var motion = Vector2()

enum Player_State {IDLE, MOVE_LEFT, MOVE_RIGHT, JUMP, DOUBLE_JUMP}
var state = Player_State.IDLE

func _physics_process(delta):
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		state = Player_State.MOVE_RIGHT
		
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		state = Player_State.MOVE_LEFT
	else:
		motion.x=0
		state = Player_State.IDLE
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT	
			state = Player_State.JUMP
		
	motion = move_and_slide(motion, UP)
	match state:
		Player_State.IDLE:
			$AnimatedSprite.animation = "idle"
		Player_State.MOVE_LEFT:
			$AnimatedSprite.animation = "walking"
			$AnimatedSprite.set_flip_h(true)
		Player_State.MOVE_RIGHT:
			$AnimatedSprite.animation = "walking"	
			$AnimatedSprite.set_flip_h(false)
		Player_State.MOVE_RIGHT:
			$AnimatedSprite.animation = "jump"	
	
	pass
