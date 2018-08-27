extends KinematicBody2D

var velocity = Vector2()
var SPEED = 300
var SUPER_SPEED = 600
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
		if Input.is_action_pressed("turbo"):
			velocity.x = SUPER_SPEED
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		if Input.is_action_pressed("turbo"):
			velocity.x = -SUPER_SPEED
	else:
		velocity.x = 0
	position.y = height
	var movement = velocity

	move_and_slide(movement) 

func get_score():
	return score

func collition(body):
	if body.is_in_group('macri'):
		score = score - 10
	if body.is_in_group('oposition'):
		score = score + 1
	body.queue_free()
	


