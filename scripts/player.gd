class_name Player
extends CharacterBody2D
@export var speed = 250
@export var gravity = 10
@export var jpForce = 300

var canControl: bool = true

func _physics_process(delta):
	#check for death
	if not canControl: 
		return
		
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 1000:
			velocity.y = 1000
	
	if Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = -jpForce
	
	if is_on_floor():
		velocity.x = 100;
	#var horixontal_dir = Input.get_axis("move_left", "move_right")
	move_and_slide()

func handle_danger() -> void: 
	print("player death")
	canControl = false
	visible = false
	
	await get_tree().create_timer(0.5).timeout
	reset_player()
	
func reset_player() -> void:
	position = Vector2(0, 0)
	visible = true
	canControl = true
