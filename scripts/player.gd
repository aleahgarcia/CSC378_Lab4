class_name Player
extends CharacterBody2D
@export var speed = 250
@export var gravity = 10
@export var jpForce = 300

@onready var animation = $AnimatedSprite2D
var canControl: bool = true
var jumpSound
var backgroundMusic
var deathSound


func _ready():
	jumpSound = $jump
	backgroundMusic = $background
	deathSound = $death
	backgroundMusic.play()
	animation.play("can_idle")
	
func _physics_process(delta):
	#check for death
	if not canControl: 
		return
		
	if velocity.x == 0: 
		animation.play("can_idle")
	
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 1000:
			velocity.y = 1000
	
	if (Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("jump")) && is_on_floor():
		velocity.y = -jpForce
		jumpSound.play()
		
	if Input.is_action_pressed("ui_right"):
		velocity.x += 3
		if velocity.x > 0 and velocity.x < 15:
			animation.play("can_rolling_slow")
		elif velocity.x >= 15 and velocity.x < 30:
			animation.play("can_rolling_medium")
		else: 
			animation.play("can_rolling_fast")
	
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 3
		if velocity.x < 0 and velocity.x > -15:
			animation.play("can_rolling_slow")
		elif velocity.x <= -15 and velocity.x > -30:
			animation.play("can_rolling_medium")
		else: 
			animation.play("can_rolling_fast")

	
	#var horixontal_dir = Input.get_axis("move_left", "move_right")
	move_and_slide()

func handle_danger() -> void: 
	deathSound.play()
	backgroundMusic.play()
	print("player death")
	canControl = false
	visible = false
	
	await get_tree().create_timer(0.5).timeout
	reset_player()
	
func reset_player() -> void:
	position = Vector2(0, 0)
	velocity.x = 0
	visible = true
	canControl = true

func change_level_0() -> void:
	get_tree().change_scene_to_file("res://scenes/level0.tscn")
	
func change_level_2() -> void:
	get_tree().change_scene_to_file("res://scenes/level2.tscn")
	
func change_level_3() -> void:
	get_tree().change_scene_to_file("res://scenes/level3.tscn")
	
func ending() -> void: 
	get_tree().change_scene_to_file("res://scenes/ending.tscn")
	

	


	
