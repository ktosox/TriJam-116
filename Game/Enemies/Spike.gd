extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	global_position.x = get_parent().get_player_pos().x + 4 + randi()%60
	pass # Replace with function body.


func wait_for_stab():
	$Timer.start(3+randi()%6)
	pass

func stab_finished():
	global_position.x = get_parent().get_player_pos().x + 4 + randi()%200
	$Animator.play("spawn")
	pass

func _on_Area2D_body_entered(body):
	body.get_stabbed()
	pass # Replace with function body.


func _on_Timer_timeout():
	$Animator.play("stab")
	pass # Replace with function body.
