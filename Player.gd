extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass


func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	
	#Physics Update (Gravity?)
	if Input.action_press("ui_left"):
		print("Pressed Left")
	pass

var speed = 2.5

func _input(event):
	#print(event)
	#move_local_y(1)
	if Input.is_action_pressed("left"):
		print("Pressed Left")
		move_local_x(-speed)
	elif Input.is_action_pressed("right"):
		print("Pressed Right")
		move_local_x(speed)
	if Input.is_action_pressed("up"):
		print("Pressed Up")
		move_local_y(-speed)
	elif Input.is_action_pressed("down"):
		print("Pressed Down")
		move_local_y(speed)
	
