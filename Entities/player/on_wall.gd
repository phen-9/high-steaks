extends State

@export var player : CharacterBody2D

func Enter():
	pass

func Physics_Update(_delta : float):
	if(Input.is_action_pressed("move_down")):
		player.input_velocity.y = player.slide_speed
	else:
		player.reset_velocity()
	
	if(!Input.is_action_pressed("hold_wall")):
		Transitioned.emit(self,"inair")
	
