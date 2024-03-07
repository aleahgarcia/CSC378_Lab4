extends Node2D

@onready var animation = $CharacterBody2D/AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("cat_idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_Node2D_body_entered(body):
	if body is Player:
		body.handle_danger()
