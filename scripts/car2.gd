extends CharacterBody2D

func _ready():
	pass

func _process(delta):
	# Move left
	velocity.x = -106 # Adjust the speed as needed
	move_and_collide(velocity * delta)
