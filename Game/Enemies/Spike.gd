extends Node2D

func _ready():
	global_position.x = get_parent().get_player_pos().x + 4 + randi()%20

func wait_for_stab():
	$Timer.start(2+randf()*3)

func stab_finished():
	global_position.x = get_parent().get_player_pos().x + 30 + randi()%200
	$Animator.play("spawn")

func _on_Timer_timeout():
	$Animator.play("stab")

func _on_HitBox_body_entered(body):
	body.get_stabbed()
