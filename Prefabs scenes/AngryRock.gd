extends KinematicBody2D


var velocity = Vector2()
export var direction = -1
export var speed = 150

signal collision_with_enemy

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if is_on_wall():
		direction = direction * -1
	velocity.y = 20
	velocity.x = speed * direction
	
	
	move_and_slide(velocity, Vector2.UP)


func _on_sides_checker_body_entered(body):
	emit_signal("collision_with_enemy")
