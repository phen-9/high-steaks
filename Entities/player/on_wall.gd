extends State

@export var player : CharacterBody2D
@export var stick_sfx : AudioStreamPlayer2D
@export var slide_sfx : AudioStreamPlayer2D

func Enter():
	stick_sfx.play()
	player.reset_velocity()
	pass

func Update(_delta : float):
	if(!Input.is_action_pressed("hold_wall") || !player.is_on_wall()):
		Transitioned.emit(self,"inair")
	if(Input.is_action_just_pressed("jump")):
		Transitioned.emit(self,"walljump")

func Physics_Update(_delta : float):
	if(Input.is_action_pressed("move_down")):
		if(!slide_sfx.playing):
			slide_sfx.play()
		player.input_velocity.y = player.slide_speed
	else:
		slide_sfx.stop()
		player.reset_velocity()
	
	
