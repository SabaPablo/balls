extends Node2D

var width
var balls = preload("res://entitys/ball.tscn")
var pro_ball = preload("res://entitys/ballon.tscn")
var sarasa
var patoB
var VELOCITY = 200
var ball_direction 

func _ready():
	width = get_viewport().get_visible_rect().size.x
	randomize()
	ball_direction = Vector2()
	sarasa = 500
	patoB = 1000

func _process(delta):
	get_node("score/Label").set_text(String(get_node("player").get_score()))
	var y= (rand_range(10,210) ) *-1
	if(sarasa < delta * 20):
		ball_direction = Vector2(rand_range(-VELOCITY,VELOCITY),rand_range(-VELOCITY,VELOCITY))
		var new_ball = balls.instance()
		new_ball.set_global_position(Vector2(rand_range(0,width),y))
		new_ball.set_axis_velocity(ball_direction)
		new_ball.add_to_group("oposition")
		add_child(new_ball)
		sarasa = 500
	else:
		sarasa -= 5
		
	if(patoB < delta * 20):
		ball_direction = Vector2(rand_range(-VELOCITY,VELOCITY),rand_range(-VELOCITY,VELOCITY))
		var new_ball = pro_ball.instance()
		new_ball.set_global_position(Vector2(rand_range(0,width),y))
		new_ball.set_axis_velocity(ball_direction)
		new_ball.add_to_group("macri")
		add_child(new_ball)
		patoB = 1000
	else:
		patoB -= 5
		