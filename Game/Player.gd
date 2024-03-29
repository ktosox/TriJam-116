extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var move = 18.0

var dead = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("ui_accept") and !dead:
		$AnimatedSprite.animation = "stand"
		$Steps.volume_db = -200
	if event.is_action_released("ui_accept") and !dead:
		$AnimatedSprite.animation = "walk"
		$Steps.volume_db = -5

func _physics_process(delta):
	var moveVector = Vector2()
	if !Input.is_action_pressed("ui_accept") and !dead:
		moveVector.x = move
		
	move_and_slide(moveVector)


func get_stabbed():
	$AnimatedSprite.animation = "die"
	dead = true
	$Steps.volume_db = -200
	get_parent().lose_game()
	pass

	
