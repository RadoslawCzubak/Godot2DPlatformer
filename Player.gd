extends KinematicBody2D

const UP = Vector2(0,-1)
const DOWN = Vector2(0,1)
const RIGHT = Vector2(1,0)
const LEFT = Vector2(-1,0)
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -350
var motion = Vector2()

enum Player_State {IDLE, MOVE_LEFT, MOVE_RIGHT, JUMP, DOUBLE_JUMP}
var state = Player_State.IDLE

export var player_hp = 3
export var HIT_JUMP_MULTIPLIER = 1.5
export var TRAMPOLINE_JUMP_MULTIPLIER = 2.5

signal character_death

signal hp_changed(new_hp_points)

func _ready():
	emit_signal("hp_changed", player_hp)

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
	else:
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
		Player_State.JUMP:
			$AnimatedSprite.animation = "jump"	
	
	pass


func bounce():
	motion.y = JUMP_HEIGHT * HIT_JUMP_MULTIPLIER


func _on_collision_with_enemy():
	player_hp -= 1
	bounce()
	emit_signal("hp_changed", player_hp)
	if(player_hp == 0):
		emit_signal("character_death")
		queue_free()
	
	
func trampolineJump():
	motion.y = JUMP_HEIGHT * TRAMPOLINE_JUMP_MULTIPLIER


func _on_level_ended():
	print("You won!")
