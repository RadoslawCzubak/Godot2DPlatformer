extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_body_entered(body):
	body.trampolineJump()
	$AnimatedSprite.play()
	$TrampolineJump.play()
