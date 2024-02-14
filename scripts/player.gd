extends CharacterBody2D
@export var speed = 250
@export var gravity = 10
@export var jpForce = 300

func _physics_process(delta):
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 1000:
			velocity.y = 1000
	
	if Input.is_action_just_pressed("ui_up") && is_on_floor():
		velocity.y = -jpForce
	
	if is_on_floor():
		velocity.x = 100;
	#var horixontal_dir = Input.get_axis("move_left", "move_right")
	move_and_slide()

