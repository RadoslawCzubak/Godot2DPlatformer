extends Area2D



signal level_ended

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	emit_signal("level_ended")
