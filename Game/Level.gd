extends Node2D

var spikeScene = preload("res://Enemies/Spike.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func start_game():
	$TimerSpike.start(6)
	pass

func get_player_pos():
	return $Player.global_position
	pass

func lose_game():
	$Front/Back/AnimationPlayer.play("showEnd")
	$Ambience.stop()
	$TimerSpike.stop()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TimerSpike_timeout():
	$TimerSpike.wait_time +=8
	var newSpike = spikeScene.instance()
	add_child(newSpike)
	pass # Replace with function body.
