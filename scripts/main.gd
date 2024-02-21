extends Node

@export var available_levels: Array[LevelData]
@onready var _2d_scene = $"2DScene"

func _ready() -> void:
	LManager.mainScene = _2d_scene
	LManager.levels = available_levels
