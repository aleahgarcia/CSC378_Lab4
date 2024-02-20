extends Node

var levels : Array[LevelData]

var mainScene : Node2D = null
var loaded_level : Level = null

func unload_level() -> void:
	if is_instance_valid(loaded_level):
		loaded_level.queue_free()
		
	loaded_level = null

func load_level(Lid: int) -> void:
	print("Lid: %s" % Lid)
	unload_level()
	
	var level_data = get_level_data_by_id(Lid)
	if not level_data:
		return
	var level_path = "res://scenes%s.tscn" % level_data.level_path
	var level_res:= load(level_path)
	
	if level_res:
		loaded_level = level_res.instantiate()
		mainScene.add_child(loaded_level) 

func get_level_data_by_id(id: int) -> LevelData:
	var level_to_return: LevelData = null
	for lvl: LevelData in levels:
		if lvl.level_id == id:
			level_to_return = lvl
			
	return level_to_return
