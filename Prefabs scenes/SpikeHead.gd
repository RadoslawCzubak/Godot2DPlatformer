extends Area2D



signal collision_with_enemy

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.





func _on_SpikeHead_body_entered(body):
	emit_signal("collision_with_enemy")
