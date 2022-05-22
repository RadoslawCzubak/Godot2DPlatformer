extends CanvasLayer

var coins = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$PointsLabel/Label.text = "x " + String(coins)


func _on_Strawberry_point_collected():
	coins = coins + 1
	_ready()


func _on_Player_hp_changed(new_hp_points):
	$HealthLabel/Label.text = "x " + String(new_hp_points)


func _on_level_ended():
	$LevelResultLabel.visible = true
	$LevelResultLabel.text = "You won!"


func _on_character_death():
	$LevelResultLabel.visible = true
	$LevelResultLabel.text = "You lost!"
