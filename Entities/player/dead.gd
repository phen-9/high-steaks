extends State

@export var death_sfx : AudioStreamPlayer2D


func Enter() -> void:
	death_sfx.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
