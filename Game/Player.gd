extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 50.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	move_and_slide(speed* Vector2(int(Input.is_action_pressed("ui_left") )-int(Input.is_action_just_pressed("ui_right")),0))
