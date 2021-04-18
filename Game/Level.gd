extends Node2D

var spikeScene = preload("res://Enemies/Spike.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func start_game():
	$TimerSpike.start(6)
	$Player.move = 42.0
	pass

func get_player_pos():
	return $Player.global_position
	pass

func lose_game():
	$Front/Back/AnimationPlayer.play("showEnd")
	$Ambience.stop()
	$TimerSpike.stop()
	pass

func win_game():
	$Player.collision_layer = 0
	$Front/Back/AnimationPlayer.play("showWin")
	$Night.play("New Anim (2)")
	pass


func _on_TimerSpike_timeout():
	$TimerSpike.wait_time +=8
	var newSpike = spikeScene.instance()
	add_child_below_node($Player,newSpike)
	pass # Replace with function body.


func _on_nightArea_body_entered(body):
	$Night.play("New Anim")
	pass # Replace with function body.


func _on_win_body_entered(body):
	win_game()
	pass # Replace with function body.
