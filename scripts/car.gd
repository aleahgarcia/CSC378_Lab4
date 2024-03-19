extends CharacterBody2D

func _ready():
	pass

func _process(delta):
	# Move left
	velocity.x = -100 # Adjust the speed as needed
	move_and_collide(velocity * delta)

func _on_attack_area_body_entered_car(body):
	if body is Player:
		body.handle_danger()
