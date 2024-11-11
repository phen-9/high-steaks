extends State

@onready var timer = $"../../WaitTimer"

func Enter():
	timer.start(3)

func _on_wait_timer_timeout() -> void:
	Transitioned.emit(self,"murder")
