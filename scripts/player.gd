extends KinematicBody2D

var velocity = Vector2()
var SPEED = 300
var height
var score 


func _ready():
	height = get_viewport().get_visible_rect().size.y
	velocity.x = 0
	velocity.y = 0
	score = 0
	

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
	else:
		velocity.x = 0
	position.y = height
	var movement = velocity

	move_and_slide(movement) 

func get_score():
	return score

func collition(body):
	body.queue_free()
	score = score +1

