extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("ui_accept"):
		$AnimatedSprite.animation = "stand"
	if event.is_action_released("ui_accept"):
		$AnimatedSprite.animation = "walk"

func _physics_process(delta):
	var moveVector = Vector2()
	if !Input.is_action_pressed("ui_accept"):
		moveVector.x = 8.0
	move_and_slide(moveVector)

	
