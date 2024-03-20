extends Area2D

func _ready():
	pass
	
func _on_body_entered(body):
	if body is Player:
		body.handle_danger()
		var character_body = get_parent()
		character_body.reset_position()
