extends CharacterBody2D

# How fast the player moves
@export var speed: float = 200.0

func _physics_process(delta):
	# Start with no movement
	var input_vector = Vector2.ZERO
	
	# Check left/right input
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	# Check up/down input
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	# Make sure diagonal movement isn’t faster than straight
	input_vector = input_vector.normalized()

	# Figure out final velocity
	velocity = input_vector * speed
	
	# Move the player and handle collisions
	move_and_slide()
