extends State

@export var player : CharacterBody2D

func Enter():
	player.can_wall = false
	player.reset_velocity()
	pass

func Update(_delta : float):
	if(!Input.is_action_pressed("hold_wall")):
		Transitioned.emit(self,"inair")
	if(Input.is_action_just_pressed("jump")):
		Transitioned.emit(self,"walljump")

func Physics_Update(_delta : float):
	if(Input.is_action_pressed("move_down")):
		player.input_velocity.y = player.slide_speed
		print("SDFJBIBFIUEFEW")
	else:
		player.reset_velocity()
	
	
