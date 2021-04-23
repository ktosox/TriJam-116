extends Node2D

var spikeScene = preload("res://Enemies/Spike.tscn")

var wonGame = false


func start_game():
	$TimerSpike.start(6)
	$Player.move = 42.0

func get_player_pos():
	return $Player.global_position

func lose_game():
	if wonGame :
		return
	$Menu/Back/MenuAnimator.play("showEnd")
	$Ambience.stop()
	$TimerSpike.stop()

func win_game():
	wonGame = true
	$Player.collision_layer = 0
	$Menu/Back/MenuAnimator.play("showWin")
	$Night.play("Lighten")

func _on_TimerSpike_timeout():
	$TimerSpike.wait_time += 14
	var newSpike = spikeScene.instance()
	add_child_below_node($Player,newSpike)

func _on_nightArea_body_entered(body):
	$Night.play("Darken")

func _on_win_body_entered(body):
	win_game()


func _on_StartGame_pressed():
	$Menu/Back/MenuAnimator.play("showGame")
	start_game()

func _on_TryAgain_pressed():
	get_tree().reload_current_scene()
