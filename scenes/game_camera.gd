extends Camera2D

var target_position = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	make_current()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	acquire_target()
	
#Camera Follows Player with following code
#global_position = target_position This is used to keep player at center always
	
	global_position = global_position.lerp(target_position, 1.0 - exp(-delta * 20)) #lerp is used for smoothing camera and delaying the camera slightly behind player
	
	
func acquire_target():
	var player_nodes = get_tree().get_nodes_in_group("player")
	if player_nodes.size() > 0:
		var player = player_nodes[0] as Node2D #casting
		target_position = player.global_position
		
