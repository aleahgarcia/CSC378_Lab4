extends Node

var initial_positions = []

func _ready():
	for child in get_children():
		if child is CharacterBody2D:
			initial_positions.append(child.position)

func reset_all_cars():
	for i in range(initial_positions.size()):
		var child = get_child(i)
		if child is CharacterBody2D:
			child.position = initial_positions[i]
