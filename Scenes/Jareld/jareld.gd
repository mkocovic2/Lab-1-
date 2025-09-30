extends Node2D

var player_inside = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	$Area2D/Instructions.visible = true
	$Area2D/Name.visible = true
	player_inside = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	$Area2D/Instructions.visible = false
	$Area2D/Name.visible = false

func _process(delta: float) -> void:
	if player_inside and Input.is_action_just_pressed("ui_accept"): # "ui_accept" = Space/Enter by default
		get_tree().change_scene_to_file("res://Scenes/grampic.tscn")
