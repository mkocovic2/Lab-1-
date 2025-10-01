extends Node2D

# Tracks if the player is inside the area
var player_inside = false
# Tracks if the NPC has been insulted or not
var insulted = false
# Tracks if the NPC should follow the player
var follow_player = false
# Reference to the player node
var player_node = null
# How fast the NPC follows
@export var follow_speed = 80

func _ready() -> void:
	# Get the player node when the game starts
	player_node = get_parent().get_node("Player")

func _process(delta: float) -> void:
	# Handle interaction when inside
	interact()
	# If following, move towards the player
	if follow_player:
		var direction = (player_node.global_position - global_position).normalized()
		global_position += direction * follow_speed * delta
	
func interact() -> void:
	# If the player is inside and presses the accept key
	if player_inside and Input.is_action_just_pressed("ui_accept"):
		if insulted:
			# Change to normal sprite
			$Sprite2D.texture = load("res://Assets/Textures/Mike.png")
			# Update instructions
			$Area2D/Instructions.text = "Press space bar to insult..."
			# Play voice line
			$AudioStreamPlayer2D.stream = load("res://Assets/Audio/Mike_Audio/itsok.mp3")
			$AudioStreamPlayer2D.play()
			# NPC is not insulted anymore and stops following
			insulted = false
			follow_player = false
		else:
			# Change to angry sprite
			$Sprite2D.texture = load("res://Assets/Textures/MikeMad.png")
			# Update instructions
			$Area2D/Instructions.text = "Press spacebar to apologize..."
			# Play voice line
			$AudioStreamPlayer2D.stream = load("res://Assets/Audio/Mike_Audio/hey!.wav")
			$AudioStreamPlayer2D.play()
			# NPC is insulted and starts following
			insulted = true
			follow_player = true
		
func _on_area_2d_body_entered(body: Node2D) -> void:
	# Show name
	$Area2D/Name.visible = true
	# Show instructions
	$Area2D/Instructions.visible = true
	# Player is inside
	player_inside = true
	
func _on_area_2d_body_exited(body: Node2D) -> void:
	# Hide name
	$Area2D/Name.visible = false
	# Hide instructions
	$Area2D/Instructions.visible = false
	# Player is not inside
	player_inside = false
