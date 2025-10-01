extends Node2D

func _ready():
	# Start playing the background music right away
	$AudioStreamPlayer2D.play()
	
func _process(delta: float) -> void:
	# If the player presses the spacebar button
	if Input.is_action_just_pressed("ui_accept"):
		# Switch to the main scene
		get_tree().change_scene_to_file("res://Scenes/Levels/Main Scene.tscn")
