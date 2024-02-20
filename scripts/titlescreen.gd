class_name StartMenu
extends Control


func _on_start_button_pressed():
	LManager.load_level(1)
	#deactivate()
	get_tree().change_scene_to_file("res://scenes/level0.tscn")


func _on_credits_pressed():
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
	

func _on_pressed():
	get_tree().change_scene_to_file("res://scenes/how_to_play.tscn")
	
func deactivate() -> void:
	hide()
	set_process(false)
	set_physics_process(false)
	set_process_unhandled_input(false)
	set_process_input(false)
	
func activate() -> void:
	show()
	set_process(true)
	set_physics_process(true)
	set_process_unhandled_input(true)
	set_process_input(true)
