extends CanvasLayer

var coins = 0
export var countdown = 60.0
var countdown_run = true

signal countdown_end
# Called when the node enters the scene tree for the first time.
func _ready():
	$PointsLabel/Label.text = "x " + String(coins)


func _process(delta):
	if countdown_run:	
		if countdown > 0:
			countdown -= delta
			$Countdown.text = String(ceil(countdown))+" s"
		else:
			emit_signal("countdown_end")
		


func _on_Strawberry_point_collected():
	coins = coins + 1
	$CollectSound.play()
	_ready()


func _on_Player_hp_changed(new_hp_points):
	$HealthLabel/Label.text = "x " + String(new_hp_points)


func _on_level_ended():
	$LevelResultLabel.visible = true
	$LevelResultLabel.text = "You won!"


func _on_character_death():
	$LevelResultLabel.visible = true
	$LevelResultLabel.text = "You lost!"
