extends State

@onready var timer = $"../../WaitTimer"
@onready var knife = $"../../KnifeBody"
@export var sprite : Sprite2D

@export var build : AudioStreamPlayer2D
@export var startup : AudioStreamPlayer2D

var played_sound = false

func Enter():
	build.play()
	timer.start(1)

func Update(_delta : float):
	if(!timer.is_stopped()):
		vibrate()
	else:
		if(!played_sound):
			startup.play()
			played_sound = true
		knife.velocity.y += 1000
		Transitioned.emit(self,"return")
	
func vibrate():
	sprite.offset.y = randf_range(-2,2)
	sprite.offset.x = randf_range(-2,2)
