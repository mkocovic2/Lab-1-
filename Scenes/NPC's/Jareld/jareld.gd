extends Node2D

# Keep track if the player is inside the area
var player_inside = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	# Show the instructions
	$Area2D/Instructions.visible = true
	# Show the name
	$Area2D/Name.visible = true
	# Player is inside
	player_inside = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	# Hide the instructions
	$Area2D/Instructions.visible = false
	# Hide the name
	$Area2D/Name.visible = false
	# Player is not inside
	player_inside = false

func _process(delta: float) -> void:
	# If the player is inside and presses the accept key
	if player_inside and Input.is_action_just_pressed("ui_accept"):
		# Change to the grampic scene
		get_tree().change_scene_to_file("res://Scenes/Levels/grampic.tscn")
