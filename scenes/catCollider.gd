extends CollisionPolygon2D


# Called when the node enters the scene tree for the first time.
#func _ready():



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if body is Player:
		body.handle_danger()
