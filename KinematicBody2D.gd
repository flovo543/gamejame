extends KinematicBody2D

const SPEED = 7
const GRAVITY = 20
const JUMPFORCE = 500
const MAXFALLSPEED = 200
const UP = Vector2(0, -1)
const MAXSPEED = 80
const ACC = 10

var facing_right = true
var motion = Vector2()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	
	motion.y += GRAVITY
	
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	if facing_right:
		$icon.scale.x = 1
	else:
		$icon.scale.x = -1
		
	motion.x = clamp(motion.x, -MAXSPEED, MAXSPEED)
	
	if Input.is_action_pressed("left"):
		motion.x -= ACC
		facing_right = false
	elif Input.is_action_pressed("right"):
		motion.x += ACC
		facing_right = true
	else:
		motion.x = lerp(motion.x, 0, 0.2)
		$AnimationPlayer.play("PlayerIdle")
	

	
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = -JUMPFORCE
			
	motion = move_and_slide(motion, UP)


#
func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass
