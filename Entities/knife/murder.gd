extends State

@onready var timer = $"../../WaitTimer"
@onready var knife = $"../../KnifeBody"
@export var sprite : Sprite2D

func Enter():
	timer.start(1)

func Update(_delta : float):
	if(!timer.is_stopped()):
		vibrate()
	else:
		knife.velocity.y += 1000
		Transitioned.emit(self,"return")
	
func vibrate():
	sprite.offset.y = randf_range(-2,2)
	sprite.offset.x = randf_range(-2,2)
