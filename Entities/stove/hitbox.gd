extends Hitbox

@onready var timer = $Timer

func _ready() -> void:
	timer.start(.2)
	pass # Replace with function body.



func _on_timer_timeout() -> void:
	queue_free()
