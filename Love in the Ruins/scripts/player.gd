extends CharacterBody2D;

# Control the speed, can be adjusted
const speed = 100;
var current_dir = "none";

func _ready():
	$AnimatedSprite2D.play("down_idle")

func _physics_process(delta):
	player_movement(delta)
	
	
# Handle the input from the player	
func player_movement(delta):
	# velocity is part of Godot
	# because we use a grid movement
	# TODO make super smooth movement later, watch the video from DevWorm
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.y = speed
		velocity.x = 0	
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.y = -speed
		velocity.x = 0
	else:
		play_anim(0)
		velocity.x =0
		velocity.y=0
	# built in function	
	move_and_slide()
	
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")
	
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")
		
	if dir == "down":
		anim.flip_h = true
		if movement == 1:
			anim.play("down_walk")
		elif movement == 0:
			anim.play("down_idle")
			
	if dir == "up":
		anim.flip_h = true
		if movement == 1:
			anim.play("up_walk")
		elif movement == 0:
			anim.play("up_idle")										
