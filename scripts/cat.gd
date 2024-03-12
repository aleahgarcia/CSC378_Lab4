extends CharacterBody2D

@onready var animation = $AnimatedSprite2D

var speed = 2
var isChasing = false
var player = null
var initialPosition = null

# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("cat_idle")
	initialPosition = position.x


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if isChasing:
		if player.position.x < position.x:
			animation.play("cat_walk_left")			
			position.x -= 2
		elif player.position.x > position.x: 
			animation.play("cat_walk_right")
			position.x += 2
		else:
			animation.play("cat_idle")
	move_and_slide()


		
func _on_chase_area_body_entered(body):
	print("body entered")
	player = body
	isChasing = true
	
func _on_chase_area_body_exited(body):
	print("body exited")
	player = null
	isChasing = false
	animation.play("cat_idle")
	


func _on_attack_area_body_entered(body):
	if body is Player:
		position.x = initialPosition
		position.y = 0
		player = null
		isChasing = false
		animation.play("cat_idle")
		body.handle_danger()



