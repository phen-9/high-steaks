extends State

@export var player :CharacterBody2D
# Called when the node enters the scene tree for the first time.
func OnEnter() -> void:
	player.velocity.y = 0
	pass # Replace with function body.

func Physics_Update(delta: float) -> void:
	player.velocity.x = Input.get_axis("move_left","move_right")
	pass
