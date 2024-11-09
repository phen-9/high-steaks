extends Node
class_name VelocityComponent

# Called when the node enters the scene tree for the first time.
var velocity : Vector2

func _ready() -> void:
	velocity = Vector2(0,0)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
