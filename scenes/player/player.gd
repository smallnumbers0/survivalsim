extends CharacterBody2D


const MAX_SPEED = 125
const ACCELERATION_SMOOTHING = 30


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var movement_vector = get_movement_vector()
	var direction = movement_vector.normalized()
	var target_velocity = direction * MAX_SPEED #200 pixels / sec in direction we press
	velocity = velocity.lerp(target_velocity, 1 - exp(-delta * ACCELERATION_SMOOTHING))
	move_and_slide() #tells body to move and creates smooth collisions


func get_movement_vector():
	var movement_vector = Vector2.ZERO #sets to (0,0)
	var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left") #if right is pressed x = 1 and if both are pressed we get 0.
	var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up") #since down is positive and up is negative down comes first
	return Vector2(x_movement, y_movement)
