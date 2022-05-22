extends Area2D


signal point_collected

func _on_strawberry_body_entered(body):
	emit_signal("point_collected")
	queue_free()
