extends CharacterBody2D

var initial_position = Vector2(0,0)

func _ready():
	initial_position = position

func _process(delta):
	velocity.x = -110 
	move_and_collide(velocity * delta)

func reset_position():
	var character_body = get_parent()
	character_body.reset_all_cars()
